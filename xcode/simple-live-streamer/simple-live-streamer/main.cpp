//
//  main.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 07/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include <iostream>
#include <assert.h>
#include <pthread.h>

#include "server.hpp"
#include "frontend.hpp"

pthread_t webserverThread;
pthread_t frontendThread;

int main(int argc, const char * argv[]) {
    // Start threads

    int rc;

    rc = pthread_create(&webserverThread, NULL, server, NULL);
    assert(rc == 0);

    frontend();
    

    pthread_exit(NULL);
}
