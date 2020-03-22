//
//  file-paths.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "file-paths.hpp"
#include <filesystem>
#include <mach-o/dyld.h>

void FilePaths::generatePaths() {
    //TODO
    //TODO url encode 
    
    char pathStr[1024];
    uint32_t size = sizeof(pathStr);
    if (_NSGetExecutablePath(pathStr, &size) != 0) {
        printf("Path buffer too small; need size %u\n", size);
        exit(0);
    }
        
    std::filesystem::path path(pathStr);
    std::string base = path.remove_filename();

    // std::cout << path.remove_filename() << std::endl;



    config = base + "../Resources/config.json";
    frontEnd = "file://" + base + "../Resources/site/index.html";
    ffmpeg = base + "ffmpeg";
    lighttpd = base + "lighttpd";
    site = "file://" + base + "../Resources/site/index.html";









    config =  "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/config.json";
    frontEnd = "file:///Users/andries/Development/Git/Grace%20London/simple-live-audio-streamer/components/interface/dist/index.html";
    
	site = "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/components/site/dist/";



    temp = "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/temp";
    temp += "/simple-livestream-temp";

    // readlink /proc/self/exe
    //std::filesystem::temp_directory_path

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