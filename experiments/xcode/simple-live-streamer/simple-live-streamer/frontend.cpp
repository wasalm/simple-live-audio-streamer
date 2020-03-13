//
//  frontend.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 07/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include <iostream>
#include "frontend.hpp"
#include "libs/webview/webview.h"


/*
 * For documentation see https://github.com/LenKagamine/webview
 */

// Run this in main thread
void frontend() {
    webview::webview w(true, nullptr);
    w.set_title("Simple live streaming");
    w.set_size(1200, 700, WEBVIEW_HINT_NONE);
//    w.navigate("http://grace.london");
    w.navigate("file:///Users/andries/Development/Git/Grace%20London/simple-live-audio-streamer/experiments/app-interface/v2/index.html");
    w.run();

}
