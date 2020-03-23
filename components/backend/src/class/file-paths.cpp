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
#include "../lib/json.hpp"

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
    std::cout << path.remove_filename() << std::endl;

    // Development
    // config = base + "../../config.json";
    // frontEnd = "file://" + url_encode_path(base) + "../../interface/dist/index.html";
    // site = base + "../../site/dist/";
    // ffmpeg = base + "../../binaries/ffmpeg";
    // lighttpd = base + "../../binaries/lighttpd";

    // Distribution
    config = base + "../Resources/config.json";
    frontEnd = "file://" + url_encode_path(base) + "../Resources/app/index.html";
    site = base + "../Resources/site/";
    ffmpeg = base + "ffmpeg";
    lighttpd = base + "lighttpd";

    temp = std::filesystem::temp_directory_path();
    temp += "/com.andries-salm.grace.livestream";
    std::cout << "Temporary folder: " << temp << std::endl;

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