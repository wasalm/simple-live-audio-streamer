# simple-live-audio-streamer
A low volume, live streaming audio app over socks5 proxy.

## Build Dependencies
We have the following build dependencies

1.  XCode
    Most is written in c++ and hence must be compiled using XCode.
2. Nodejs
    For bundling and minifying html files we need the following modules.
    2.1.    npm install uglify-js -g
    2.2.    npm install html-minifier -g
    2.3.    npm install clean-css-cli -g

## Build scripts    
Build scripts are in the folder build-scripts.

Minify frontend site:

    build-site.sh

Minify app interface:
    
    build-interface.sh
