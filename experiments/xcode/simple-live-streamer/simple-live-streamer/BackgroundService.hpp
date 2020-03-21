//
//  BackgroundService.hpp
//  simple-live-streamer
//
//  Created by Andries Salm on 21/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#ifndef BackgroundService_hpp
#define BackgroundService_hpp

#include <iostream>
#include <vector>
#include "pstream.h"

class BackgroundService {
    redi::pstreambuf * stream;
    void _stop(bool reinit);
public:
    
    void start(std::string file, std::vector<std::string> arguments);
    bool isRunning();
    void stop();
    
    BackgroundService();
    ~BackgroundService();
};

#endif /* BackgroundService_hpp */
