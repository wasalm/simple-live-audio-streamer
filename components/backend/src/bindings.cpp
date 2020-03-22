//
//  bindings.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "bindings.hpp"
#include "lib/pstream.h"
#include <string>
#include <regex>
#include <filesystem>
#include <fstream>

std::string getSettings(std::string input, Config * c) {
    return c ->toJSON();
}

std::string getAudioDevices(std::string input, FilePaths * f) {
    std::string result = "[";

    redi::ipstream in(f ->ffmpeg + " -f avfoundation -list_devices true -i \"\"",redi::pstreambuf::pstderr);
    std::string line;

    bool found = false;
    bool first = true;
    while (std::getline(in, line)) {
        if(line.find("AVFoundation audio devices:") != -1) {
            found = true;
        }

        if(found) {
            std::regex re("\\[AVFoundation(.*)\\] \\[([0-9]+)\\] (.*)$");
            std::smatch match;
            if(std::regex_search(line, match, re))
            {
                if(first) {
                    first = false;
                } else {
                    result += ", ";
                }
                result += "{id: " + match.str(2) + ",name: \"" + match.str(3) + "\"}";
            }
        }
    }

    result += "]";
    return result;
}
    
std::string setSettings(std::string input, Config * c, FilePaths * f) {
    // Parse Data
    c -> fromJSON(input.substr(1,input.size()-2));
    // Save to file
    c -> toFile(f ->config);
    return "0";
}

std::string startStream(std::string input, Config * c, FilePaths * f,BackgroundService * lighttpd, BackgroundService * ffmpeg, BackgroundService * ssh, std::string code) {
    
    /*
     * Create temporary folder and files
     */

    if(std::filesystem::exists(f -> temp + "/config")){
        std::cout << "Old recordings found, removing old data." << std::endl;
        std::filesystem::remove_all(f -> temp + "/config");
    }
    std::filesystem::create_directory(f -> temp + "/config");

    if(std::filesystem::exists(f -> temp + "/public")){
        std::cout << "Old recordings found, removing old data." << std::endl;
        std::filesystem::remove_all(f -> temp + "/public");
    }
    std::filesystem::create_directory(f -> temp + "/public");
    
    /* SSH Key */
    std::ofstream sshKeyFile(f -> temp + "/config/ssh.key");
    sshKeyFile << c -> proxyKey;
    sshKeyFile.close();
    
    std::filesystem::permissions(f -> temp + "/config/ssh.key", std::filesystem::perms::owner_read | std::filesystem::perms::owner_write, std::filesystem::perm_options::replace);

    /* Lighttpd Config */
    std::ofstream lighttpdConfigFile(f -> temp + "/config/lighttpd.conf");
    lighttpdConfigFile << "server.document-root = \"" << f -> temp + "/public/\"" << std::endl;
    lighttpdConfigFile << "server.port = " << c->webserverPort << std::endl << std::endl;

    lighttpdConfigFile << "setenv.add-response-header += (" << std::endl;
    lighttpdConfigFile << "    \"Expires\" => \"0\"," << std::endl;
    lighttpdConfigFile << "    \"Cache-Control\" => \"no-store, no-cache, must-revalidate\"," << std::endl;
    lighttpdConfigFile << "    \"Pragma\" => \"no-cache\"" << std::endl;
    lighttpdConfigFile << ")" << std::endl << std::endl;
    
    lighttpdConfigFile << "mimetype.assign = (" << std::endl;
    lighttpdConfigFile << "    \".html\" => \"text/html\"," << std::endl;
    lighttpdConfigFile << "    \".txt\" => \"text/plain\"," << std::endl;
    lighttpdConfigFile << "    \".js\" => \"text/javascript\"," << std::endl;
    lighttpdConfigFile << "    \".css\" => \"text/css\"," << std::endl;
    lighttpdConfigFile << "    \".jpg\" => \"image/jpeg\"," << std::endl;
    lighttpdConfigFile << "    \".png\" => \"image/png\"," << std::endl;
    lighttpdConfigFile << "    \".svg\" => \"image/svg+xml\"," << std::endl;
    lighttpdConfigFile << "    \".json\" => \"application/json\"," << std::endl;
    lighttpdConfigFile << "    \".m3u8\" => \"application/x-mpegURL\"," << std::endl;
    lighttpdConfigFile << "    \".ts\" => \"video/MP2T\"," << std::endl;
    lighttpdConfigFile << ")" << std::endl;

    lighttpdConfigFile.close();

    /* Assets */
    std::filesystem::copy(f-> site, f -> temp + "/public/" + code, std::filesystem::copy_options::recursive);

    /* Add additional folders */
    std::filesystem::create_directory(f -> temp + "/public/" + code + "/api");
    std::filesystem::create_directory(f -> temp + "/public/" + code + "/stream");

    /* API */
    // std::ofstream apiFile(f -> temp + "/public/" + code + "/api/details.json");
    // sshKeyFile << c -> proxyKey;
    // sshKeyFile.close();


//     {
//     "sermon": {
//         "title": "A life without titles",
//         "speaker": "Jeremy Moses",
//         "text": "Psalm 123:4-5" 
//     },

//     "audio": {
//         "src": "stream/live.m3u8"
//     },

//     "links": {
//         "live": "http://wasalm-34538.portmap.io:34538/index.html",
//         "share": "http://wasalm-34538.portmap.io:34538/share.html"
//     }
// }

   /*
    * Run Lighttpd
    */
   // std::string command = f->lighttpd + " -D -f \"" + f -> temp + "/config/lighttpd.conf\"";
   // lighttpd -> start(command);


   /*
    * Run SSH
    */

   //TODO

   /*
    * Run FFMpeg
    */

   //TODO
    
    
    
    
    
    //Return urls for QR codes.
    std::string liveUrl =
    "http://"
        + c->webserverHost
        + ":" + std::to_string(c->webserverPort)
        + "/" + code
        + "/index.html";
    
    std::string shareUrl =
    "http://"
        + c->webserverHost
        + ":" + std::to_string(c->webserverPort)
        + "/" + code
        + "/share.html";
    
    return "{liveUrl: \"" + liveUrl + "\", shareUrl: \"" + shareUrl + "\"}";
}

std::string stopStream(std::string input,BackgroundService * lighttpd, BackgroundService * ffmpeg, BackgroundService * ssh) {
    
    ffmpeg -> stop();
    ssh -> stop();
    lighttpd -> stop();
    
    return "0";
}

std::string isStreaming(std::string input,BackgroundService * lighttpd, BackgroundService * ffmpeg, BackgroundService * ssh) {

    //Temporary
    if(lighttpd -> isRunning()) {
        return "true";
    }

        
    // if(lighttpd -> isRunning() && ffmpeg -> isRunning() && ssh -> isRunning()) {
    //     return "true";
    // }

    return "false";
}



