//
//  bindings.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "bindings.hpp"
#include "pstream.h"
#include <regex>

std::string getSettings(std::string input, Config * c) {
    return c ->toJSON();
}

std::string getAudioDevices(std::string input, FilePaths * f) {
    std::string result = "[";

    std::cout << f ->ffmpeg + " -f avfoundation -list_devices true -i \"\"" << std::endl;
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


//
//std::string startStream(std::string input, Config c) {
//    //TODO
//    std::string liveUrl = "http://wasalm-34538.portmap.io:34538/index.html";
//    std::string shareUrl = "http://wasalm-34538.portmap.io:34538/share.html";
//    return "{liveUrl: \"" + liveUrl + "\", shareUrl: \"" + shareUrl + "\"}";
//}
//
//std::string stopStream(std::string input) {
//    //TODO
//    return input;
//}
