//
//  config.hpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#ifndef config_hpp
#define config_hpp

#include <iostream>

class Config {
public:
    std::string toJSON();
    void toFile(std::string path);
    void fromJSON(std::string data);
    void fromFile(std::string path);
    
    int audioDevice;
    
    bool audioChannels;
    unsigned int audioChannelsLeft;
    unsigned int audioChannelsRight;
    
    bool audioVolume;
    int audioVolumeVal;
    
    unsigned int audioBitrate;
    
    std::string webserverHost;
    unsigned int webserverPort;
    
    bool proxy;
    std::string proxyUser;
    std::string proxyHost;
    unsigned int proxyPort;
    std::string proxyKey;
};

#endif /* config_hpp */
