//
//  server.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 07/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include <iostream>
#include "server.hpp"
#include <assert.h>
#include <atomic>
#include <string>

#include <libssh/libssh.h>

#include "picohttpparser.hpp"

/*
 * Configuration
 */
std::string sshHost = "wasalm-34538.portmap.io";
std::string sshUser = "wasalm.first";
int sshPort = 22;
int webPort = 34538;
std::string baseUrl = "/1234/";
std::string webPath = "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/site";

std::string b64_key = "-----BEGIN RSA PRIVATE KEY-----\n"
"MIIEowIBAAKCAQEAxj607vwuNJrHgYvd501HBTsDDzA84As0SSlYuuGixC+8mrHA\n"
"LHQmUVSmmpa5AH7GtyDUjcjd0DqpaBUs20BQE+FyDPY/NazX1OR0P/Acgi6Ntjry\n"
"Uharx1gnmf/REyuUG9btkIKGXbd0B3jfLOLOUuYr/JH0gNWh9jKKxzYlZZbjZ7VB\n"
"2TeoJ7WE8eFNX4cXC7aJiJlX9wbGOOvyjOBUswcCsyefvvDX66POthjDvbPvlTdc\n"
"Ht/b/+e/GiVdRZUyUCyc9NTmhUIBlO2xONGvM1yrR2VC7G987VzmmG3H9kAGdxSR\n"
"Yq1K8ir5vUaiiVcNj1KHZEDJuTSh+4T/FpudYwIDAQABAoIBAD31rVEgSkSwt3ga\n"
"weEf+vl8hylBF1WiytWu8Yd/LAMLNHRY58o9BxjWTzfzsaCg/vSPcz9ZL1J8cyQP\n"
"sjRYdm6wQJgigoEBI3fraxXsssxRRoNVCxVy9n9YYxAzryHBtgm5dAh9cwdpZf9L\n"
"3NzHilrIi6jl6Tg3DObIxy0aFDgakuh3eMGG5wna7UXLV9h5EMAhL6hmTc14aRln\n"
"H80cSdhgwn1Ilhun+vOovSQBU7Ecm3DOa6Be1Tp1ZKlz0PDNnIS9EjalQZx4oNv9\n"
"lgH0ckpF/K1h5dvB68Zt2rtGD3CaF9GJMnSr/tDHyiJJlUW38y9XCK24v5+YBiBQ\n"
"ldFd4KECgYEA4cTsHNxEmrklXXwrwqVpw8iI2dJ/avCJLNpjqPgnO3hAw/Zga7Pr\n"
"hPM0bS9EiAuA2Z5C8E56lPYjilv2TRYos5NpNGk9R8PrR24d338fNerYc6+05htK\n"
"4gEhENLOHW9RQY1oO+h22PEZYmCl13QrW4LIKFfGLUcMJU3TnJkcuJMCgYEA4MpJ\n"
"pdtSNNqpAusr93A5+xKpTvSns9yOfVAugrHUhSSYV0iE66z1XmxcBhfgf2fbURad\n"
"R0wIxWQYbf+7E0btDBZXwyKzpnuFYPHGyHhQRcgk8bkgd9eh3h7+USovwtcaDr59\n"
"5z7EB+9dHmdRTEXCwxfGDMBY5jSyUgFoxMn2mfECgYBzo4nMvoXlOjAJUjCX4mHq\n"
"Bi0SZN8ex1V7w+CIC5MMwutpdCivAdkAoBGaWzue80VsMcPXklr3MZvCopflpBP0\n"
"5uxcDAt3VsKMM7rZXyN9WmzD1JuzwQb5+9oT4+Xu7bWQ/f0FsmwtclCuMxK+6KHM\n"
"nZAoGc1II7v034gkDcjIQQKBgBg7lm7r0tPh0qB+67F0BrwbSec6Fq4cE7xMnYb3\n"
"Vrq3tDiMl8+0SItSUSVTA5+YeZsnPfNGrhdhcATDsc4lMj7AVduybP2AiWNnDQ/l\n"
"cHnlVp48X9SriUahvrbPPnDZsXRvcrEwIf/c/QPfDXOUfad8c5xCTBMdETAn+Lxm\n"
"LVBxAoGBAMXKbTqHyOvrTU8VBZLbQYWhE900IFnCzGcTbw2f19puHEvbajqDj4JS\n"
"Wl+6xGcsYglYVQNd/M1L3GtGQGZczmNPqs6HA43j4J3QwVfIiWbsZWOyBUdFUR4P\n"
"yHDnhAT3SACPJFgMCzljZS3re8Tg/AananFuO7vWGSEr12zaKjnt\n"
"-----END RSA PRIVATE KEY-----";


std::string notFoundPage = ""
"HTTP/1.1 404 Not Found\n"
"Content-Type: text/plain\n"
"\n"
"Not Found\n";

std::string forbiddenPage = ""
"HTTP/1.1 403 Forbidden\n"
"Content-Type: text/plain\n"
"\n"
"Not Found\n";

std::atomic<bool> serverRunning(true);

/*
 * Internal functions
 */

bool connectSSH(ssh_session* sessionP, ssh_key* privKeyP) {
    int rc;
    
    /*
     * Create a new ssh session
     */
    *sessionP = ssh_new();
    if(*sessionP == NULL) {
        std::cout << "Error in ssh_new()" << std::endl;
        return false;
    }

    /*
     * Set options from globals
     */
    ssh_options_set(*sessionP, SSH_OPTIONS_HOST, sshHost.c_str());
    ssh_options_set(*sessionP, SSH_OPTIONS_PORT, &sshPort);
    ssh_options_set(*sessionP, SSH_OPTIONS_USER, sshUser.c_str());
    
    /*
     * Connect to remote server
     */
    rc = ssh_connect(*sessionP);
    if (rc != SSH_OK) {
        fprintf(stderr, "Error connecting: %s\n", ssh_get_error(*sessionP));
        return false;
    }
    
    /*
     * Create SSH private key
     */
    *privKeyP = ssh_key_new();
    if(*privKeyP == NULL) {
        std::cout << "Error in ssh_key_new()" << std::endl;
        ssh_disconnect(*sessionP);
        ssh_free(*sessionP);
        return false;
    }
    
    /*
     *  Load SSH key
     */
    rc = ssh_pki_import_privkey_base64(b64_key.c_str(), NULL, NULL, NULL, privKeyP);
    if(rc != SSH_OK) {
        std::cout << "Error in ssh_pki_import_privkey_base64: " << ssh_get_error(*sessionP) << std::endl;
        
        ssh_key_free(*privKeyP);
        ssh_disconnect(*sessionP);
        ssh_free(*sessionP);
        return false;
    }
    
    /*
     * Authenticate
     */
    rc = ssh_userauth_publickey(*sessionP, NULL, *privKeyP);
    if (rc != SSH_AUTH_SUCCESS) {
        fprintf(stderr, "Error authenticating with password: %s\n",
               ssh_get_error(*sessionP));
        ssh_key_free(*privKeyP);
        ssh_disconnect(*sessionP);
        ssh_free(*sessionP);
        return false;
     }
    
    return true;
}

void disconnectSSH(ssh_session* sessionP, ssh_key* privKeyP) {
    
    ssh_key_free(*privKeyP);
    ssh_disconnect(*sessionP);
    ssh_free(*sessionP);
}

bool handleChannel(ssh_channel * channelP) {
    char buf[4096] = "";
    const char *method, *path;
    int pret, minor_version;
    struct phr_header headers[100];
    size_t buflen = 0, prevbuflen = 0, method_len, path_len, num_headers;
    ssize_t rret;

    while (serverRunning) {
        /* read the request */
        rret = ssh_channel_read(*channelP, &buf + buflen, sizeof(buf) - buflen, 0);

        if (rret <= 0){
            printf("Http parser error: IOError");
            return false; //IOError;
        }
        prevbuflen = buflen;
        buflen += rret;
        /* parse the request */
        num_headers = sizeof(headers) / sizeof(headers[0]);
        pret = phr_parse_request(buf, buflen, &method, &method_len, &path, &path_len, &minor_version, headers, &num_headers, prevbuflen);

        if (pret > 0)
            break; /* successfully parsed the request */
        else if (pret == -1) {
            printf("Http parser error: ParseError");
            return false;
        }
            
        /* request is incomplete, continue the loop */
        assert(pret == -2);
        if (buflen == sizeof(buf)) {
            printf("Http parser error: RequestIsTooLongError");
            return false;
        }
            
    }

    /*
     * Check if path starts with the password
     */
    if(strncmp(path,baseUrl.c_str(), baseUrl.length())) {
        // Path doesn't start with the base URL.
        // Hence send 403 Forbidden
        int nbytes = forbiddenPage.length();
        int nwritten = ssh_channel_write(*channelP, forbiddenPage.c_str(), nbytes);
        if (nwritten != nbytes)
        {
            fprintf(stderr, "Error sending answer.\n");
            ssh_channel_send_eof(*channelP);
            ssh_channel_free(*channelP);
            return false;
        }
        return true;
    }
    
    
//    /path?query#frag
//    TODO: REMOVE QUERY
//    TODO: normalize path
//    IF file exists, then return file, else return noting
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    printf("request is %d bytes long\n", pret);
    printf("method is %.*s\n", (int)method_len, method);
    printf("path is %.*s\n", (int)path_len, path);
    printf("HTTP version is 1.%d\n", minor_version);
    printf("headsers:\n");
    for (int i = 0; i != num_headers; ++i) {
        printf("%.*s: %.*s\n", (int)headers[i].name_len, headers[i].name,
               (int)headers[i].value_len, headers[i].value);
    }

    std::string helloworld = ""
    "HTTP/1.1 200 OK\n"
    "Content-Type: text/html\n"
    "Content-Length: 113\n"
    "\n"
    "<html>\n"
    "  <head>\n"
    "    <title>Hello, World!</title>\n"
    "  </head>\n"
    "  <body>\n"
    "    <h1>Hello, World!</h1>\n"
    "  </body>\n"
    "</html>\n";
     
    int nbytes = helloworld.length();
    int nwritten = ssh_channel_write(*channelP, helloworld.c_str(), nbytes);
    if (nwritten != nbytes)
    {
        fprintf(stderr, "Error sending answer.\n");
        ssh_channel_send_eof(*channelP);
        ssh_channel_free(*channelP);
        return false;
    }
    printf("Sent answer\n");
    return true;
}

int remote_web_server(ssh_session * sessionP) {
    int rc;
    ssh_channel channel;
    int port = 0;
    
    rc = ssh_channel_listen_forward(*sessionP, NULL, webPort, NULL);
    if (rc != SSH_OK) {
        fprintf(stderr, "Error opening remote port: %s\n",
                ssh_get_error(*sessionP));
        return rc;
    }

    while (serverRunning) {
        channel = ssh_channel_accept_forward(*sessionP, 10000, &port);
        if (channel == NULL) {
            //No request received probably. Just ignore the error and try again.
//            fprintf(stderr, "Error waiting for incoming connection: %s\n",
//                    ssh_get_error(*sessionP));
//            return SSH_ERROR;
        } else {
        
            if(!handleChannel(&channel)) {
                return SSH_ERROR;
            }
            
            ssh_channel_send_eof(channel);
            ssh_channel_free(channel);
        }
    }
    return SSH_OK;
}


void * server(void*) {
    ssh_session my_ssh_session;
    ssh_key privKey;
    
    if(connectSSH(&my_ssh_session, &privKey)) {
        //Connection succes
        
        std::cout <<"1 Hello, World!\n";
        remote_web_server(&my_ssh_session);
        std::cout <<"2 Hello, World!\n";
        
        disconnectSSH(&my_ssh_session, &privKey);
    }
     
    /*
     * Exit thead
     */
    pthread_exit(NULL);
}
