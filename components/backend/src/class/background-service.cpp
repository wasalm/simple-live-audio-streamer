//
//  BackgroundService.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 21/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "background-service.hpp"

BackgroundService::BackgroundService() {
    stream = new redi::pstreambuf;
}

BackgroundService::~BackgroundService() {
    std::cout << "Stopping BackgroundService" << std::endl;
    _stop(false);
}

bool BackgroundService::isRunning() {
    if(stream->is_open()) {
        return ! (stream ->exited());
    }
    
    //Stream not initialized, hence not opened
    return false;
}

void BackgroundService::start(std::string file, std::vector<std::string> args) {
    if(stream->is_open()) {
        //Stream already initialized
        std::cout << "Stream already initialized, restart" << std::endl;
        
        _stop(true);
    }
    
    std::cout << "Running: " << file << std::endl;
    if(stream ->open(file, args, 0) == NULL) {
        std::cout << "Error starting program: Error " << std::strerror(stream->error()) << std::endl;
    }
}


void BackgroundService::_stop(bool reinit) {
    if(stream -> is_open()) {
        if(!stream -> exited()) {
            //First request exit
            stream -> kill();
            
            //actually close the program, warning this is blocking !
            stream -> close();
        }
    }

    // Clean up
    delete stream;
    
    if(reinit) {
        stream = new redi::pstreambuf;
    }
}

void BackgroundService::stop() {
    _stop(true);
}

