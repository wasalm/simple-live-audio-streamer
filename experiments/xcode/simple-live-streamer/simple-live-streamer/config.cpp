//
//  config.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "config.hpp"
#include <fstream>
#include <sstream>

std::string Config::toJSON() {
    std::string result = "{";
    result += "\"audioDevice\": ";
    result += std::to_string(audioDevice);
    result += ", ";

    result += "\"audioChannels\": ";
    result += (audioChannels ? "true" : "false");
    result += ", ";

    result += "\"audioChannelsLeft\": ";
    result += std::to_string(audioChannelsLeft);
    result += ", ";

    result += "\"audioChannelsRight\": ";
    result += std::to_string(audioChannelsRight);
    result += ", ";

    result += "\"audioVolume\": ";
    result += (audioVolume ? "true" : "false");
    result += ", ";

    result += "\"audioVolumeVal\": ";
    result += std::to_string(audioVolumeVal);
    result += ", ";

    result += "\"audioBitrate\": ";
    result += std::to_string(audioBitrate);
    result += ", ";

    result += "\"webserverHost\": ";
    result += json_escape(webserverHost);
    result += ", ";

    result += "\"webserverPort\": ";
    result += std::to_string(webserverPort);
    result += ", ";

    result += "\"proxy\": ";
    result += (proxy ? "true" : "false");
    result += ", ";

    result += "\"proxyUser\": ";
    result += json_escape(proxyUser);
    result += ", ";

    result += "\"proxyHost\": ";
    result += json_escape(proxyHost);
    result += ", ";

    result += "\"proxyPort\": ";
    result += std::to_string(proxyPort);
    result += ", ";

    result += "\"proxyKey\": ";
    result += json_escape(proxyKey);

    result += "}";
    return result;
}


void Config::fromJSON(std::string data) {
    // TODO
    
    //    //TODO
    ////    std::cout<< webview::json_parse(input.substr(1,input.size()-2), "proxyUser", 0) << std::endl;
    //    return input;

}

void Config::toFile(std::string path) {
    //TODO
    std::ofstream t;
    t.open (path, std::ios::out | std::ios::trunc);

    if (t.fail()) {
        // file could not be opened
        std::cout << "Error writing config file, ignoring..." << std::endl;
        return;
    }
    
    t << toJSON();
    t.close();
}

void Config::fromFile(std::string path) {

    std::ifstream t(path);
    if (t.fail()) {
        // file could not be opened
        std::cout << "Error reading config file, ignoring..." << std::endl;
        return;
    }
    
    std::stringstream buffer;
    buffer << t.rdbuf();
    
    fromJSON(buffer.str());
    t.close();
}

std::string Config::json_escape(std::string s) {
    std::string result = "\"";
    
    for(int i=0; i< s.size(); i++ )
    {
        switch ((char) s.at(i)) {
            case '\\':
                result += "\\\\";
                break;
            case '\r':
                result += "\\r";
                break;
            case '\n':
                result += "\\n";
                break;
            case '"':
                result += "\\\"";
                break;
            default:
                result += s.at(i);
        }
    }
    
    result += "\"";
    return result;
}
