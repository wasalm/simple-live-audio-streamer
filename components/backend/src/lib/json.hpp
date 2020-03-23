//
//  json.hpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#ifndef json_hpp
#define json_hpp

#include <iostream>

std::string url_encode_path(const std::string s);
std::string json_escape(std::string s);
std::string json_parse(const std::string s, const std::string key, const int index);
int json_parse_c(const char *s, size_t sz, const char *key, size_t keysz, const char **value, size_t *valuesz);
int json_unescape(const char *s, size_t n, char *out);

#endif /* json_hpp */
