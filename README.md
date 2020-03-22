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

## Sources 
In the code we use the following c++ libraries:

### Webview
We combine the following libraries
1. https://github.com/zserge/webview
2. https://github.com/lukevers/webview/blob/edit-menu/webview.h

### PStreams - POSIX Process I/O for C++

See http://pstreams.sourceforge.net/
