//
//  frontend.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 07/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include <iostream>
#include "frontend.hpp"
#include "webview.h"


/*
 * For documentation see https://github.com/LenKagamine/webview
 */

// Run this in main thread
void frontend() {
    webview::webview w(true, nullptr);
    w.set_title("Minimal example");
    w.set_size(480, 320, WEBVIEW_HINT_NONE);
      w.navigate("https://en.m.wikipedia.org/wiki/Main_Page");
      w.run();

}
