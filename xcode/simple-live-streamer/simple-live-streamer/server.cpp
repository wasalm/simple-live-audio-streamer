//
//  server.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 07/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include <iostream>
#include "server.hpp"
#include <assert.h>

//#define LIBSSH_STATIC 1
#include <libssh/libssh.h>


void * server(void*) {
    //create ssh session
    ssh_session my_ssh_session = ssh_new();
    assert(my_ssh_session != NULL);
        
    
    std::cout <<" Hello, World!\n";
    
    
    // End session
    ssh_free(my_ssh_session);
    
    //End thread
    pthread_exit(NULL);
}
