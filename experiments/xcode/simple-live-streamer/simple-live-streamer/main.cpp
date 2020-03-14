//
//  main.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 07/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include <iostream>
#include <assert.h>
#include <vector>
#include <regex>

#include "webview.h"
#include "pstream.h"
/*
 * Configuration
 */

struct filePathsT {
    std::string frontEnd;
    std::string ffmpeg;
    std::string lighttpd;
    std::string config;
    std::string web;
};

struct configT {
    int audioDevice;
    
    bool audioChannels;
    unsigned int audioChannelsLeft;
    unsigned int audioChannelsRight;
    
    bool audioVolume;
    int audioVolumeVal;
    
    unsigned int audioBitrate;
    
    std::string webserverHost;
    unsigned int webserverPort;
    
    bool proxy;
    std::string proxyUser;
    std::string proxyHost;
    unsigned int proxyPort;
    std::string proxyKey;
};

filePathsT filePaths {
    .frontEnd =  "file:///Users/andries/Development/Git/Grace%20London/simple-live-audio-streamer/experiments/app-interface/v3/index.html",
    .ffmpeg = "/Users/andries/Development/Git/Grace\\ London/simple-live-audio-streamer/experiments/ffmpeg/ffmpeg",
    .lighttpd = "/Users/andries/Development/Git/Grace\\ London/simple-live-audio-streamer/experiments/bash/lighttpd/lighttpd",
    .config = "TODO",
    .web = "TODO"
};
    
std::string passcode = "";

//TODO LOAD DATA FROM FILE
configT config{
    .audioDevice = 0,
    
    .audioChannels = true,
    .audioChannelsLeft = 16,
    .audioChannelsRight = 17,
    
    .audioVolume = true,
    .audioVolumeVal = 15,
    
    .audioBitrate = 128,
    
    .webserverHost = "wasalm-34538.portmap.io",
    .webserverPort = 34538,
    
    .proxy = true,
    .proxyUser = "wasalm.first",
    .proxyHost = "wasalm-34538.portmap.io",
    .proxyPort = 22,
    
    .proxyKey = "TODO"
};
    
/*
 * Globals
 */
webview_t w;

/*
 * HTML Bindings
 */

std::string getAudioDevices(std::string input) {
    std::string result = "[";
    
    std::cout << filePaths.ffmpeg + " -f avfoundation -list_devices true -i \"\"" << std::endl;
    redi::ipstream in(filePaths.ffmpeg + " -f avfoundation -list_devices true -i \"\"",redi::pstreambuf::pstderr);
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

void loadSettings() {
    //TODO:
    //Load settings from a file
    
    // readlink /proc/self/exe
}
    
std::string getSettings(std::string input) {
    std::string result = "{";
    result += "audioDevice: ";
    result += std::to_string(config.audioDevice);
    result += ", ";
    
    result += "audioChannels: ";
    result += (config.audioChannels ? "true" : "false");
    result += ", ";
    
    result += "audioChannelsLeft: ";
    result += std::to_string(config.audioChannelsLeft);
    result += ", ";
    
    result += "audioChannelsRight: ";
    result += std::to_string(config.audioChannelsRight);
    result += ", ";
    
    result += "audioVolume: ";
    result += (config.audioVolume ? "true" : "false");
    result += ", ";
    
    result += "audioVolumeVal: ";
    result += std::to_string(config.audioVolumeVal);
    result += ", ";
    
    result += "audioBitrate: ";
    result += std::to_string(config.audioBitrate);
    result += ", ";
    
    result += "webserverHost: \"";
    result += config.webserverHost;
    result += "\", ";
    
    result += "webserverPort: ";
    result += std::to_string(config.webserverPort);
    result += ", ";
    
    result += "proxy: ";
    result += (config.proxy ? "true" : "false");
    result += ", ";
    
    result += "proxyUser: \"";
    result += config.proxyUser;
    result += "\", ";
    
    result += "proxyHost: \"";
    result += config.proxyHost;
    result += "\", ";
    
    result += "proxyPort: ";
    result += std::to_string(config.proxyPort);
    result += ", ";
    
    result += "proxyKey: \"";
    result += config.proxyKey;
    
    result += "\"}";
    return result;
}

std::string setSettings(std::string input) {
    //TODO
    return input;
}

std::string startStream(std::string input) {
    //TODO
    std::string liveUrl = "http://wasalm-34538.portmap.io:34538/index.html";
    std::string shareUrl = "http://wasalm-34538.portmap.io:34538/share.html";
    return "{liveUrl: \"" + liveUrl + "\", shareUrl: \"" + shareUrl + "\"}";
}

std::string stopStream(std::string input) {
    //TODO
    return input;
}

/*
 * Main
 */
int main(int argc, const char * argv[]) {

    loadSettings();
    
    w = webview_create(true, nullptr);
    webview_set_title(w, "Grace Livestream");
    webview_set_size(w, 1200, 700, WEBVIEW_HINT_NONE);
    webview_navigate(w, filePaths.frontEnd.c_str());

    static_cast<webview::webview *>(w)->bind("getAudioDevices", getAudioDevices);
    static_cast<webview::webview *>(w)->bind("getSettings", getSettings);
    static_cast<webview::webview *>(w)->bind("setSettings", setSettings);
    static_cast<webview::webview *>(w)->bind("startStream", startStream);
    static_cast<webview::webview *>(w)->bind("stopStream", stopStream);

    webview_run(w);
    
//    webview_eval(w, "window.dispatchEvent(new Event(\"appError\"))");

    return 0;
}
