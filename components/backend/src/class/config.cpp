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
#include <string>
#include "../lib/json.hpp"


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
    try{
        audioDevice = std::stoi(json_parse(data, "audioDevice", 0));
    }catch(...) {
        audioDevice = 0;
    }
    
    audioChannels = json_parse(data, "audioChannels", 0).compare("true") == 0;

    try{
        audioChannelsLeft = std::stoi(json_parse(data, "audioChannelsLeft", 0));
    }catch(...) {
        audioChannelsLeft = 0;
    }
    
    try{
        audioChannelsRight = std::stoi(json_parse(data, "audioChannelsRight", 0));
    }catch(...) {
        audioChannelsRight = 1;
    }
    
    audioVolume = json_parse(data, "audioVolume", 0).compare("true") == 0;
    
    try{
        audioVolumeVal = std::stoi(json_parse(data, "audioVolumeVal", 0));
    }catch(...) {
        audioVolumeVal = 0;
    }
    
    try{
        audioBitrate = std::stoi(json_parse(data, "audioBitrate", 0));
    }catch(...) {
        audioBitrate = 128;
    }
    
    try{
        webserverPort = std::stoi(json_parse(data, "webserverPort", 0));
    }catch(...) {
        webserverPort = 8080;
    }
    
    webserverHost = json_parse(data, "webserverHost", 0);
    
    proxy = json_parse(data, "proxy", 0).compare("true") == 0;
    
    proxyUser = json_parse(data, "proxyUser", 0);
    proxyHost = json_parse(data, "proxyHost", 0);
    
    try{
        proxyPort = std::stoi(json_parse(data, "proxyPort", 0));
    }catch(...) {
        proxyPort = 22;
    }
    
    proxyKey = json_parse(data, "proxyKey", 0);
}

/*
 * File methods
 */

void Config::toFile(std::string path) {
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
