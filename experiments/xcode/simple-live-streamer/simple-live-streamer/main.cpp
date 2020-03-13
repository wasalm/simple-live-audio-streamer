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

#include "webview.h"
#include "pstream.h"

/*
 * Configuration
 */

std::string frontEndUrl = "file:///Users/andries/Development/Git/Grace%20London/simple-live-audio-streamer/experiments/app-interface/v3/index.html";
std::string ffmpegPath = "/Users/andries/Development/Git/Grace\\ London/simple-live-audio-streamer/experiments/ffmpeg/ffmpeg";
std::string ffprobePath = "/Users/andries/Development/Git/Grace\\ London/simple-live-audio-streamer/experiments/ffmpeg/ffprobe";
std::string lighttpdPath = "/Users/andries/Development/Git/Grace\\ London/simple-live-audio-streamer/experiments/bash/lighttpd/lighttpd";
std::string lighttpdConfPath = "/Users/andries/Development/Git/Grace\\ London/simple-live-audio-streamer/experiments/bash/lighttpd/lighttpd.conf";


webview_t w;

std::string getAudioDevices(std::string input) {
    // print names of all header files in current directory
    std::cout << ffmpegPath + " -f avfoundation -list_devices true -i \"\"" << std::endl;
        redi::ipstream in(ffmpegPath + " -f avfoundation -list_devices true -i \"\"",redi::pstreambuf::pstderr);
        std::string str;
        while (std::getline(in, str)) {
            std::cout << "MESSAGE: " << str << std::endl << std::endl;
        }
    
    //TODO PARSE and return
    
    return input;
}

std::string getSettings(std::string input) {
    //TODO
    return input;
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


int main(int argc, const char * argv[]) {

    w = webview_create(true, nullptr);
    webview_set_title(w, "Grace Livestream");
    webview_set_size(w, 1200, 700, WEBVIEW_HINT_NONE);
    webview_navigate(w, frontEndUrl.c_str());

    static_cast<webview::webview *>(w)->bind("getAudioDevices", getAudioDevices);
    static_cast<webview::webview *>(w)->bind("getSettings", getSettings);
    static_cast<webview::webview *>(w)->bind("setSettings", setSettings);
    static_cast<webview::webview *>(w)->bind("startStream", startStream);
    static_cast<webview::webview *>(w)->bind("stopStream", stopStream);

    webview_run(w);
    
    // readlink /proc/self/exe
//    webview_eval(w, "window.dispatchEvent(new Event(\"appError\"))");

    return 0;
}
