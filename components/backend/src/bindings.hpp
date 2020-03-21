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
#include "class/config.hpp"
#include "class/file-paths.hpp"
#include "class/background-service.hpp"

std::string getAudioDevices(std::string input, FilePaths * f);
std::string getSettings(std::string input, Config * c);
std::string setSettings(std::string input, Config * c, FilePaths * f);

std::string startStream(std::string input, Config * c, FilePaths * f, BackgroundService * lighttpd, BackgroundService * ffmpeg, BackgroundService * ssh, std::string code);
std::string stopStream(std::string input,BackgroundService * lighttpd, BackgroundService * ffmpeg, BackgroundService * ssh);
std::string isStreaming(std::string input,BackgroundService * lighttpd, BackgroundService * ffmpeg, BackgroundService * ssh);

#endif /* bindings_hpp */
