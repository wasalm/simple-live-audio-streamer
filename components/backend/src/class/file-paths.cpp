//
//  file-paths.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "file-paths.hpp"
#include <filesystem>

void FilePaths::generatePaths() {
    //TODO
    //TODO url encode 
    
    config =  "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/config.json";
    
    frontEnd = "file:///Users/andries/Development/Git/Grace%20London/simple-live-audio-streamer/components/interface/dist/index.html";

    
    ffmpeg = "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/components/binaries/ffmpeg";
    lighttpd = "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/components/binaries/lighttpd";
    
	site = "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/components/site/dist/";

    temp = "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/temp";
    temp += "/simple-livestream-temp";

    // readlink /proc/self/exe

    /*
     * Create temporary folder and files
     */

    if(std::filesystem::exists(temp)){
        std::cout << "Old recordings found, removing old data." << std::endl;
        std::filesystem::remove_all(temp);
    }

    std::filesystem::create_directory(temp);
}

FilePaths::~FilePaths() {
	if(std::filesystem::exists(temp)){
        std::filesystem::remove_all(temp);
    }
}