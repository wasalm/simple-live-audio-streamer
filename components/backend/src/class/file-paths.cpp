//
//  file-paths.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "file-paths.hpp"

void FilePaths::generatePaths() {
    //TODO
    
    config =  "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/config.json";
    
    frontEnd = "file:///Users/andries/Development/Git/Grace%20London/simple-live-audio-streamer/components/interface/dist/index.html";
    
    ffmpeg = "/Users/andries/Development/Git/Grace\\ London/simple-live-audio-streamer/components/binaries/ffmpeg";
    
    lighttpd = "/Users/andries/Development/Git/Grace\\ London/simple-live-audio-streamer/components/binaries/lighttpd";
    
    // readlink /proc/self/exe
}
