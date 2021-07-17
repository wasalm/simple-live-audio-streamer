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
To compile FFmpeg use the following commands

    git clone --depth 1 https://github.com/FFmpeg/FFmpeg
    ./configure \
        --enable-static \
        --disable-autodetect \
        --disable-programs \
        --disable-runtime-cpudetect \
        --disable-doc \
        --disable-everything \
        --enable-decoder="aac,pcm*" \
        --enable-encoder=aac \
        --enable-parser=aac \
        --enable-demuxer=mpegts,aac \
        --enable-protocol=file,pipe,hls \
        --enable-bsf=aac_adtstoasc,h264_mp4toannexb,hevc_mp4toannexb \
        --enable-muxer=adts,latm,mpegts,segment,hls \
        --enable-filter=pan,volume,aresample \
        --enable-indev=avfoundation \
        --disable-runtime-cpudetect \
        --enable-pthreads \
        --enable-ffmpeg \
        --enable-small \
        --enable-avfoundation
    make -j4


### Lighttpd
To compile lighthttpd use
    
    ccmake -Wno-dev -DBUILD_STATIC=ON -DWITH_OPENSSL=0 -DWITH_LUA=0 -DWITH_ZLIB=0 -DWITH_PCRE=0 -DWITH_BZIP2=0 -DWITH_WEBDAV_PROPS=0 ..
    
When you get the error `plugin-static.h not found` see https://redmine.lighttpd.net/boards/3/topics/5912.
Namely in the src directory of lighttpd we created a file plugin-static.h with the following contents

    PLUGIN_INIT(mod_auth)
    PLUGIN_INIT(mod_redirect)
    PLUGIN_INIT(mod_rewrite)
    PLUGIN_INIT(mod_cgi)
    PLUGIN_INIT(mod_fastcgi)
    PLUGIN_INIT(mod_scgi)
    PLUGIN_INIT(mod_ssi)
    PLUGIN_INIT(mod_proxy)
    PLUGIN_INIT(mod_indexfile)
    PLUGIN_INIT(mod_dirlisting)
    PLUGIN_INIT(mod_staticfile)
    PLUGIN_INIT(mod_setenv)

## Mac App bundle
For MacOS an application is a folder containing all the resources the app needs.
To create an application one needs to compile the Objective-C app in *components/bundle/src/Grace Livestream.xcodeproj* and
export it to *components/bundle/dist/bundle.app*

Later the build scripts will replace the empty program with the correct binaries.


## Build scripts    
Build scripts are in the folder build-scripts.

Minify frontend site:

    build-site.sh

Minify app interface:
    
    build-interface.sh
    
Build Backend:
        
    build-backend.sh

Bundle in a single app:

    build-app.sh

## Build for both x86 and Apple Silicon
On a Apple M1 computer, first run above scripts in terminal to build the arm version

Rename the following packages:
    
    - components/binaries/ffmpeg to ffmpeg_arm
    - components/binaries/lighttpd to lighttpd_arm
    - components/backend/dist/main to main_arm

In terminal run 

    arch -x86_64 /bin/bash

To enable x86 mode and compile again. Rename the following packages:
    
    - components/binaries/ffmpeg to ffmpeg_x86
    - components/binaries/lighttpd to lighttpd_x86
    - components/backend/dist/main to main_x86

In the folder components/binaries/ run

     lipo -create -output ffmpeg ffmpeg_x86 ffmpeg_arm
     lipo -create -output lighttpd lighttpd_x86 lighttpd_arm

In the folder components/backend/dist/ run

     lipo -create -output main main_x86 main_arm

## Sources 
In the code we use the following c++ libraries:

### Webview
We combine the following libraries
1. https://github.com/zserge/webview
2. https://github.com/lukevers/webview/blob/edit-menu/webview.h

### PStreams - POSIX Process I/O for C++

See http://pstreams.sourceforge.net/

### Universal Apps

See https://developer.apple.com/documentation/apple-silicon/building-a-universal-macos-binary
