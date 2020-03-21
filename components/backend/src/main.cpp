//
//  main.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 07/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include <iostream>
#include <functional>

#include "lib/webview.h"

#include "class/config.hpp"
#include "class/file-paths.hpp"
#include "class/background-service.hpp"

#include "bindings.hpp"
    
/*
 * Globals
 */
std::string passcode = "";

FilePaths filePaths;
Config config;
webview_t w;

BackgroundService lighttpdService;
BackgroundService ffmpegService;
BackgroundService sshService;

std::string generatePasscode() {
    static const char alphanum[] =
        "0123456789abcdefghijklmnopqrstuvwxyz";

    std::string result;
    result.reserve(35);
    
    for(int i = 0; i < 6; i ++) {
        if(i != 0) {
            result += '-';
        }
        
        for(int j=0; j< 5; j++) {
            result += alphanum[rand() % (sizeof(alphanum) - 1)];
        }
    }

    return result;
}

/*
 * Main
 */
int main(int argc, const char * argv[]) {
    std::cout << "Simple Live stream App" << std::endl;
    passcode = generatePasscode();
    std::cout << "Using passcode: " << passcode << std::endl;
    
    filePaths.generatePaths();
    config.fromFile(filePaths.config);
    
    w = webview_create(false, nullptr);
    webview_set_title(w, "Grace Livestream");
    webview_set_size(w, 1200, 700, WEBVIEW_HINT_NONE);
    webview_navigate(w, filePaths.frontEnd.c_str());

    static_cast<webview::webview *>(w)->bind("getSettings", std::bind(&getSettings, std::placeholders::_1, &config));
    static_cast<webview::webview *>(w)->bind("getAudioDevices", std::bind(&getAudioDevices, std::placeholders::_1, &filePaths));    
    static_cast<webview::webview *>(w)->bind("setSettings", std::bind(&setSettings, std::placeholders::_1, &config, &filePaths));
    static_cast<webview::webview *>(w)->bind("startStream", std::bind(&startStream, std::placeholders::_1, &config, &filePaths, &lighttpdService, &ffmpegService, &sshService, passcode));
    static_cast<webview::webview *>(w)->bind("stopStream", std::bind(&stopStream, std::placeholders::_1, &lighttpdService, &ffmpegService, &sshService));
    static_cast<webview::webview *>(w)->bind("isStreaming", std::bind(&isStreaming, std::placeholders::_1, &lighttpdService, &ffmpegService, &sshService));
    
    webview_run(w);
    return 0;
}
