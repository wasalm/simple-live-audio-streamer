//
//  bindings.hpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#ifndef bindings_hpp
#define bindings_hpp

#include <iostream>
#include "config.hpp"
#include "filepaths.hpp"

std::string getAudioDevices(std::string input, FilePaths f);
std::string getSettings(std::string input, Config c);
//std::string setSettings(std::string input);
//std::string startStream(std::string input);

#endif /* bindings_hpp */
