//
//  config.cpp
//  simple-live-streamer
//
//  Created by Andries Salm on 20/03/2020.
//  Copyright © 2020 Andries Salm. All rights reserved.
//

#include "config.hpp"
#include <fstream>
#include <sstream>
#include <string>

std::string json_escape(std::string s);
std::string json_parse(const std::string s, const std::string key, const int index);
int json_parse_c(const char *s, size_t sz, const char *key, size_t keysz, const char **value, size_t *valuesz);
int json_unescape(const char *s, size_t n, char *out);

std::string Config::toJSON() {
    std::string result = "{";
    result += "\"audioDevice\": ";
    result += std::to_string(audioDevice);
    result += ", ";

    result += "\"audioChannels\": ";
    result += (audioChannels ? "true" : "false");
    result += ", ";

    result += "\"audioChannelsLeft\": ";
    result += std::to_string(audioChannelsLeft);
    result += ", ";

    result += "\"audioChannelsRight\": ";
    result += std::to_string(audioChannelsRight);
    result += ", ";

    result += "\"audioVolume\": ";
    result += (audioVolume ? "true" : "false");
    result += ", ";

    result += "\"audioVolumeVal\": ";
    result += std::to_string(audioVolumeVal);
    result += ", ";

    result += "\"audioBitrate\": ";
    result += std::to_string(audioBitrate);
    result += ", ";

    result += "\"webserverHost\": ";
    result += json_escape(webserverHost);
    result += ", ";

    result += "\"webserverPort\": ";
    result += std::to_string(webserverPort);
    result += ", ";

    result += "\"proxy\": ";
    result += (proxy ? "true" : "false");
    result += ", ";

    result += "\"proxyUser\": ";
    result += json_escape(proxyUser);
    result += ", ";

    result += "\"proxyHost\": ";
    result += json_escape(proxyHost);
    result += ", ";

    result += "\"proxyPort\": ";
    result += std::to_string(proxyPort);
    result += ", ";

    result += "\"proxyKey\": ";
    result += json_escape(proxyKey);

    result += "}";
    return result;
}


void Config::fromJSON(std::string data) {
    try{
        audioDevice = std::stoi(json_parse(data, "audioDevice", 0));
    }catch(...) {
        audioDevice = 0;
    }
    
    audioChannels = json_parse(data, "audioChannels", 0).compare("true") == 0;

    try{
        audioChannelsLeft = std::stoi(json_parse(data, "audioChannelsLeft", 0));
    }catch(...) {
        audioChannelsLeft = 0;
    }
    
    try{
        audioChannelsRight = std::stoi(json_parse(data, "audioChannelsRight", 0));
    }catch(...) {
        audioChannelsRight = 1;
    }
    
    audioVolume = json_parse(data, "audioVolume", 0).compare("true") == 0;
    
    try{
        audioVolumeVal = std::stoi(json_parse(data, "audioVolumeVal", 0));
    }catch(...) {
        audioVolumeVal = 0;
    }
    
    try{
        audioBitrate = std::stoi(json_parse(data, "audioBitrate", 0));
    }catch(...) {
        audioBitrate = 128;
    }
    
    try{
        webserverPort = std::stoi(json_parse(data, "webserverPort", 0));
    }catch(...) {
        webserverPort = 8080;
    }
    
    webserverHost = json_parse(data, "webserverHost", 0);
    
    proxy = json_parse(data, "proxy", 0).compare("true") == 0;
    
    proxyUser = json_parse(data, "proxyUser", 0);
    proxyHost = json_parse(data, "proxyHost", 0);
    
    try{
        proxyPort = std::stoi(json_parse(data, "proxyPort", 0));
    }catch(...) {
        proxyPort = 22;
    }
    
    proxyKey = json_parse(data, "proxyKey", 0);
}

/*
 * File methods
 */

void Config::toFile(std::string path) {
    std::ofstream t;
    t.open (path, std::ios::out | std::ios::trunc);

    if (t.fail()) {
        // file could not be opened
        std::cout << "Error writing config file, ignoring..." << std::endl;
        return;
    }
    
    t << toJSON();
    t.close();
}

void Config::fromFile(std::string path) {

    std::ifstream t(path);
    if (t.fail()) {
        // file could not be opened
        std::cout << "Error reading config file, ignoring..." << std::endl;
        return;
    }
    
    std::stringstream buffer;
    buffer << t.rdbuf();
    
    fromJSON(buffer.str());
    t.close();
}

/*
 * JSON functions (Copied from webview.h)
 */

std::string json_escape(std::string s) {
    std::string result = "\"";
    
    for(int i=0; i< s.size(); i++ )
    {
        switch ((char) s.at(i)) {
            case '\\':
                result += "\\\\";
                break;
            case '\r':
                result += "\\r";
                break;
            case '\n':
                result += "\\n";
                break;
            case '"':
                result += "\\\"";
                break;
            default:
                result += s.at(i);
        }
    }
    
    result += "\"";
    return result;
}

std::string json_parse(const std::string s, const std::string key, const int index) {
  const char *value;
  size_t value_sz;
  if (key == "") {
    json_parse_c(s.c_str(), s.length(), nullptr, index, &value, &value_sz);
  } else {
    json_parse_c(s.c_str(), s.length(), key.c_str(), key.length(), &value,
                 &value_sz);
  }
  if (value != nullptr) {
    if (value[0] != '"') {
      return std::string(value, value_sz);
    }
    int n = json_unescape(value, value_sz, nullptr);
    if (n > 0) {
      char *decoded = new char[n + 1];
      json_unescape(value, value_sz, decoded);
      std::string result(decoded, n);
      delete[] decoded;
      return result;
    }
  }
  return "";
}

int json_parse_c(const char *s, size_t sz, const char *key, size_t keysz, const char **value, size_t *valuesz) {
  enum {
    JSON_STATE_VALUE,
    JSON_STATE_LITERAL,
    JSON_STATE_STRING,
    JSON_STATE_ESCAPE,
    JSON_STATE_UTF8
  } state = JSON_STATE_VALUE;
  const char *k = NULL;
  int index = 1;
  int depth = 0;
  int utf8_bytes = 0;

  if (key == NULL) {
    index = keysz;
    keysz = 0;
  }

  *value = NULL;
  *valuesz = 0;

  for (; sz > 0; s++, sz--) {
    enum {
      JSON_ACTION_NONE,
      JSON_ACTION_START,
      JSON_ACTION_END,
      JSON_ACTION_START_STRUCT,
      JSON_ACTION_END_STRUCT
    } action = JSON_ACTION_NONE;
    unsigned char c = *s;
    switch (state) {
    case JSON_STATE_VALUE:
      if (c == ' ' || c == '\t' || c == '\n' || c == '\r' || c == ',' ||
          c == ':') {
        continue;
      } else if (c == '"') {
        action = JSON_ACTION_START;
        state = JSON_STATE_STRING;
      } else if (c == '{' || c == '[') {
        action = JSON_ACTION_START_STRUCT;
      } else if (c == '}' || c == ']') {
        action = JSON_ACTION_END_STRUCT;
      } else if (c == 't' || c == 'f' || c == 'n' || c == '-' ||
                 (c >= '0' && c <= '9')) {
        action = JSON_ACTION_START;
        state = JSON_STATE_LITERAL;
      } else {
        return -1;
      }
      break;
    case JSON_STATE_LITERAL:
      if (c == ' ' || c == '\t' || c == '\n' || c == '\r' || c == ',' ||
          c == ']' || c == '}' || c == ':') {
        state = JSON_STATE_VALUE;
        s--;
        sz++;
        action = JSON_ACTION_END;
      } else if (c < 32 || c > 126) {
        return -1;
      } // fallthrough
    case JSON_STATE_STRING:
      if (c < 32 || (c > 126 && c < 192)) {
        return -1;
      } else if (c == '"') {
        action = JSON_ACTION_END;
        state = JSON_STATE_VALUE;
      } else if (c == '\\') {
        state = JSON_STATE_ESCAPE;
      } else if (c >= 192 && c < 224) {
        utf8_bytes = 1;
        state = JSON_STATE_UTF8;
      } else if (c >= 224 && c < 240) {
        utf8_bytes = 2;
        state = JSON_STATE_UTF8;
      } else if (c >= 240 && c < 247) {
        utf8_bytes = 3;
        state = JSON_STATE_UTF8;
      } else if (c >= 128 && c < 192) {
        return -1;
      }
      break;
    case JSON_STATE_ESCAPE:
      if (c == '"' || c == '\\' || c == '/' || c == 'b' || c == 'f' ||
          c == 'n' || c == 'r' || c == 't' || c == 'u') {
        state = JSON_STATE_STRING;
      } else {
        return -1;
      }
      break;
    case JSON_STATE_UTF8:
      if (c < 128 || c > 191) {
        return -1;
      }
      utf8_bytes--;
      if (utf8_bytes == 0) {
        state = JSON_STATE_STRING;
      }
      break;
    default:
      return -1;
    }

    if (action == JSON_ACTION_END_STRUCT) {
      depth--;
    }

    if (depth == 1) {
      if (action == JSON_ACTION_START || action == JSON_ACTION_START_STRUCT) {
        if (index == 0) {
          *value = s;
        } else if (keysz > 0 && index == 1) {
          k = s;
        } else {
          index--;
        }
      } else if (action == JSON_ACTION_END ||
                 action == JSON_ACTION_END_STRUCT) {
        if (*value != NULL && index == 0) {
          *valuesz = (size_t)(s + 1 - *value);
          return 0;
        } else if (keysz > 0 && k != NULL) {
          if (keysz == (size_t)(s - k - 1) && memcmp(key, k + 1, keysz) == 0) {
            index = 0;
          } else {
            index = 2;
          }
          k = NULL;
        }
      }
    }

    if (action == JSON_ACTION_START_STRUCT) {
      depth++;
    }
  }
  return -1;
}

int json_unescape(const char *s, size_t n, char *out) {
  int r = 0;
  if (*s++ != '"') {
    return -1;
  }
  while (n > 2) {
    char c = *s;
    if (c == '\\') {
      s++;
      n--;
      switch (*s) {
      case 'b':
        c = '\b';
        break;
      case 'f':
        c = '\f';
        break;
      case 'n':
        c = '\n';
        break;
      case 'r':
        c = '\r';
        break;
      case 't':
        c = '\t';
        break;
      case '\\':
        c = '\\';
        break;
      case '/':
        c = '/';
        break;
      case '\"':
        c = '\"';
        break;
      default: // TODO: support unicode decoding
        return -1;
      }
    }
    if (out != NULL) {
      *out++ = c;
    }
    s++;
    n--;
    r++;
  }
  if (*s != '"') {
    return -1;
  }
  if (out != NULL) {
    *out = '\0';
  }
  return r;
}


