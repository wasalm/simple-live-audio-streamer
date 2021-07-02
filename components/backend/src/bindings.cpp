//
//  bindings.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "bindings.hpp"
#include "lib/pstream.h"
#include "lib/json.hpp"
#include <string>
#include <regex>
#include <vector>
#include <filesystem>
#include <fstream>
#include <string>

std::string getSettings(std::string input, Config * c) {
    return c ->toJSON();
}

std::string getAudioDevices(std::string input, FilePaths * f) {
    std::string result = "[";

    std::vector<std::string> args;
    args.push_back(f -> ffmpeg);
    args.push_back("-f");
    args.push_back("avfoundation");
    args.push_back("-list_devices");
    args.push_back("true");
    args.push_back("-i");
    args.push_back("\"\"");

    redi::ipstream in(f ->ffmpeg, args,redi::pstreambuf::pstderr);
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

    lighttpdConfigFile << "server.modules += (\"mod_setenv\")" << std::endl;

    lighttpdConfigFile << "server.connections = 100" << std::endl;

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
    std::ofstream apiFile(f -> temp + "/public/" + code + "/api/details.json");
    apiFile << "{";
    apiFile << "\"sermon\": " << input.substr(1,input.size()-2) << ",";

    apiFile << "\"audio\": {";
    apiFile << "\"src\": \"stream/live.m3u8\"";
    apiFile << "},";

    apiFile << "\"links\": {";
    apiFile << "\"live\": " << json_escape(liveUrl) << ", ";
    apiFile << "\"share\": " << json_escape(shareUrl);
    apiFile << "}";
    apiFile << "}";
    apiFile.close();

   /*
    * Run Lighttpd
    */
    std::vector<std::string> argsLighttpd;
    argsLighttpd.push_back(f->lighttpd);
    argsLighttpd.push_back("-D");
    argsLighttpd.push_back("-f");
    argsLighttpd.push_back(f -> temp + "/config/lighttpd.conf");
    lighttpd -> start(f->lighttpd, argsLighttpd);

   /*
    * Run SSH
    */
    if(c->proxy) {
        std::vector<std::string> argsSSH;
        argsSSH.push_back("/usr/bin/ssh");
        argsSSH.push_back("-v");
        argsSSH.push_back("-i");
        argsSSH.push_back(f -> temp + "/config/ssh.key");
        
        argsSSH.push_back("-o");
        argsSSH.push_back("StrictHostKeyChecking=no"); // disable hosts checking

        argsSSH.push_back("-o");
        argsSSH.push_back("UserKnownHostsFile=/dev/null"); // don't use default hosts file

        argsSSH.push_back("-o");
        argsSSH.push_back("BatchMode=yes");

        argsSSH.push_back("-N");

        argsSSH.push_back("-R");
        argsSSH.push_back(std::to_string(c->webserverPort) + ":localhost:" + std::to_string(c->webserverPort));
        
        argsSSH.push_back("-p");
        argsSSH.push_back(std::to_string(c->proxyPort));

        argsSSH.push_back(c -> proxyUser + "@" + c-> proxyHost);

        ssh -> start("/usr/bin/ssh", argsSSH);    
    }

   /*
    * Run FFMpeg
    */
    std::vector<std::string> argsFFMpeg;
    argsFFMpeg.push_back(f -> ffmpeg);

    argsFFMpeg.push_back("-f");
    argsFFMpeg.push_back("avfoundation");
    
    argsFFMpeg.push_back("-i");
    argsFFMpeg.push_back(":" + std::to_string(c -> audioDevice));

    argsFFMpeg.push_back("-acodec");
    argsFFMpeg.push_back("aac");

    argsFFMpeg.push_back("-ac");
    argsFFMpeg.push_back("2");

    if(c -> audioChannels || c -> audioVolume) {
        argsFFMpeg.push_back("-af");

        std::string filter = "";

        if(c -> audioChannels) {
            filter += "pan=stereo|FL=c" + std::to_string(c -> audioChannelsLeft) + "|FR=c" + std::to_string(c -> audioChannelsRight);
        }

        if(c -> audioChannels && c -> audioVolume) {
            filter += ',';
        }

        if(c -> audioVolume) {
            filter += "volume=" + std::to_string(c -> audioVolumeVal) + "dB";
        }

        argsFFMpeg.push_back(filter);
    }

    argsFFMpeg.push_back("-b:a");
    argsFFMpeg.push_back(std::to_string(c -> audioBitrate) + "k");      

    argsFFMpeg.push_back("-hls_flags");
    argsFFMpeg.push_back("delete_segments");

    argsFFMpeg.push_back("-hls_time");
    argsFFMpeg.push_back("15");

    argsFFMpeg.push_back("-hls_list_size");
    argsFFMpeg.push_back("5");

    argsFFMpeg.push_back("-hls_delete_threshold");
    argsFFMpeg.push_back("2");

    argsFFMpeg.push_back("-hls_segment_filename");
    argsFFMpeg.push_back("file\%03d.ts");

    argsFFMpeg.push_back("live.m3u8");

    std::filesystem::current_path(f -> temp + "/public/" + code + "/stream");
    ffmpeg -> start(f -> ffmpeg, argsFFMpeg);
        
    return "{liveUrl: " + json_escape(liveUrl) + ", shareUrl: " + json_escape(shareUrl) + "}";
}

std::string stopStream(std::string input,BackgroundService * lighttpd, BackgroundService * ffmpeg, BackgroundService * ssh) {
    
    ffmpeg -> stop();
    ssh -> stop();
    lighttpd -> stop();
    
    return "0";
}

std::string isStreaming(std::string input, Config * c, BackgroundService * lighttpd, BackgroundService * ffmpeg, BackgroundService * ssh) {

    if(c->proxy) {
        if(!ssh -> isRunning()) {
            return "false";
        }
    }
    
    if(!lighttpd -> isRunning()) {
        return "false";
    }

    if(!ffmpeg -> isRunning()) {
        return "false";
    }

    return "true";
}



