# simple-live-audio-streamer
A low volume, live streaming audio app over socks5 proxy.

## Build Dependencies
We have the following build dependencies

1.  XCode
    Most is written in c++ and hence must be compiled using XCode.
    2. cmake etc. to compile ffmpeg and lighttpd
3. Nodejs
    For bundling and minifying html files we need the following modules.
    1.    `npm install uglify-js -g`
    2.    `npm install html-minifier -g`
    3.    `npm install clean-css-cli -g`

## Prebuild binaries
This program needs a prebuild copy of ffmpeg and lighttpd
Please compile these binaries *statically* and place them inside components/binaries/

### FFmpeg
To compile ffmpeg see https://github.com/albinoz/ffmpeg-static-OSX

Copy the ffmpeg binary to components/binaries/

To test if a binary is build statically, use `otool -L ffmpeg` 

### Lighttpd
To compile lighthttpd use
    
    ccmake -Wno-dev -DWITH_OPENSSL=0 -DWITH_LUA=0 -DWITH_ZLIB=0 -DWITH_BZIP2=0 -DWITH_WEBDAV_PROPS=0 ..
    
and set PRCE support off. When you get the error *plugin-static.h not found* see https://redmine.lighttpd.net/boards/3/topics/5912.


## Build scripts    
Build scripts are in the folder build-scripts.

Minify frontend site:

    build-site.sh

Minify app interface:
    
    build-interface.sh

## Sources 
In the code we use the following c++ libraries:

### Webview
We combine the following libraries
1. https://github.com/zserge/webview
2. https://github.com/lukevers/webview/blob/edit-menu/webview.h

### PStreams - POSIX Process I/O for C++

See http://pstreams.sourceforge.net/
