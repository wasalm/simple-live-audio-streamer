//
//  config.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "config.hpp"


std::string Config::toJSON() {
    std::string result = "{";
    result += "audioDevice: ";
    result += std::to_string(audioDevice);
    result += ", ";

    result += "audioChannels: ";
    result += (audioChannels ? "true" : "false");
    result += ", ";

    result += "audioChannelsLeft: ";
    result += std::to_string(audioChannelsLeft);
    result += ", ";

    result += "audioChannelsRight: ";
    result += std::to_string(audioChannelsRight);
    result += ", ";

    result += "audioVolume: ";
    result += (audioVolume ? "true" : "false");
    result += ", ";

    result += "audioVolumeVal: ";
    result += std::to_string(audioVolumeVal);
    result += ", ";

    result += "audioBitrate: ";
    result += std::to_string(audioBitrate);
    result += ", ";

    result += "webserverHost: ";
    result += json_escape(webserverHost);
    result += ", ";

    result += "webserverPort: ";
    result += std::to_string(webserverPort);
    result += ", ";

    result += "proxy: ";
    result += (proxy ? "true" : "false");
    result += ", ";

    result += "proxyUser: ";
    result += json_escape(proxyUser);
    result += ", ";

    result += "proxyHost: ";
    result += json_escape(proxyHost);
    result += ", ";

    result += "proxyPort: ";
    result += std::to_string(proxyPort);
    result += ", ";

    result += "proxyKey: ";
    result += json_escape(proxyKey);

    result += "}";
    std::cout<< result << std::endl;
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
}

void Config::fromFile(std::string path) {
    // TODO
    
    // Temporary
    audioDevice = 0;
    audioChannels = true;
    audioChannelsLeft = 16;
    audioChannelsRight = 17;
    
    audioVolume = true;
    audioVolumeVal = 15;
    
    audioBitrate = 128;
    
    webserverHost = "wasalm-34538.portmap.io";
    webserverPort = 34538;
    
    proxy = true;
    proxyUser = "wasalm.first";
    proxyHost = "wasalm-34538.portmap.io";
    proxyPort = 22;
    
    proxyKey = "TODO\nTODO";
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
