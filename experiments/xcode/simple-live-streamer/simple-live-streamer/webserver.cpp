//
//  server.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 07/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include <iostream>
#include "webserver.hpp"

void * server(void*) {
    std::cout <<"Hello, World!\n";
     
    /*
     * Exit thead
     */
    pthread_exit(NULL);
}
