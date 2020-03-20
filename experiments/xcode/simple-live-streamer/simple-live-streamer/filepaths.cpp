//
//  filepaths.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "filepaths.hpp"


//    .frontEnd =  ,

//    .lighttpd = "/Users/andries/Development/Git/Grace\\ London/simple-live-audio-streamer/experiments/bash/lighttpd/lighttpd",
//    .config = "TODO",
//    .web = "TODO"


void FilePaths::generatePaths() {
    //TODO
    
    config =  "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/config.json";
    
    frontEnd = "file:///Users/andries/Development/Git/Grace%20London/simple-live-audio-streamer/experiments/app-interface/v3/index.html";
    
    ffmpeg = "/Users/andries/Development/Git/Grace\\ London/simple-live-audio-streamer/experiments/ffmpeg/ffmpeg";
    
    // readlink /proc/self/exe
}
