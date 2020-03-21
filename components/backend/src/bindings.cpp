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
     * Temporary test
     */
    std::string command = f->lighttpd + " -D -f " + f->lighttpd + ".conf";
    lighttpd -> start(command);
    

    
    
    
    
    
    
    
    
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
    if(lighttpd -> isRunning() ) {
        return "true";
    }

        
//
//    if(lighttpd -> isRunning() && ffmpeg -> isRunning() && ssh -> isRunning()) {
//        return "true";
//    }

    return "false";
}



