//
//  main.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 07/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include <iostream>
#include <assert.h>

#include "webview.h"
#include "pstream.h"

std::string test(std::string input) {
    std::cout << input << std::endl;
    
    return input;
}


int main(int argc, const char * argv[]) {

    // print names of all header files in current directory
    redi::ipstream in("pwd");
    std::string str;
    while (in >> str) {
        std::cout << str << std::endl;
    }
    
    
    webview::webview w(true, nullptr);
    w.set_title("Simple live streaming");
    w.set_size(1200, 700, WEBVIEW_HINT_NONE);
    w.navigate(
               "file:///Users/andries/Development/Git/Grace%20London/simple-live-audio-streamer/experiments/app-interface/v2/index.html"
    );
    
    w.bind("appTest", test);
    w.run();
    

    return 0;
}
