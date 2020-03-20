//
//  main.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 07/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include <iostream>
//#include <assert.h>
//#include <vector>
#include <functional>

#include "webview.h"

#include "config.hpp"
#include "filepaths.hpp"
#include "bindings.hpp"

    

/*
 * Globals
 */
std::string passcode = "";

FilePaths filePaths;
Config config;
webview_t w;


/*
 * Main
 */
int main(int argc, const char * argv[]) {
    filePaths.generatePaths();
    config.fromFile(filePaths.config);
    
    w = webview_create(true, nullptr);
    webview_set_title(w, "Grace Livestream");
    webview_set_size(w, 1200, 700, WEBVIEW_HINT_NONE);
    webview_navigate(w, filePaths.frontEnd.c_str());

    static_cast<webview::webview *>(w)->bind("getSettings", std::bind(&getSettings, std::placeholders::_1, config));
    
    static_cast<webview::webview *>(w)->bind("getAudioDevices", std::bind(&getAudioDevices, std::placeholders::_1, filePaths));
    
    static_cast<webview::webview *>(w)->bind("setSettings", std::bind(&setSettings, std::placeholders::_1, config, filePaths));
    
//    static_cast<webview::webview *>(w)->bind("setSettings", setSettings);
//    static_cast<webview::webview *>(w)->bind("startStream", startStream);
//    static_cast<webview::webview *>(w)->bind("stopStream", stopStream);
//
    webview_run(w);
    
//    webview_eval(w, "window.dispatchEvent(new Event(\"appError\"))");
    return 0;
}
