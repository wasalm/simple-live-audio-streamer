//
//  filepaths.hpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#ifndef filepaths_hpp
#define filepaths_hpp

#include <iostream>
class FilePaths {
public:
    void generatePaths();
    
    std::string config;
    std::string frontEnd;
    std::string ffmpeg;

    std::string lighttpd;
//    std::string web;
};



#endif /* filepaths_hpp */
