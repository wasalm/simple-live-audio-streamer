#!/bin/bash

# Get path of this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Change directory to site folder
cd "$DIR"
cd ../

# Empty build folder
rm -rf dist
mkdir dist

cd dist

# copy bundle to current folder
BUNDLE=`find ../components/bundle -type d -name "*.app"`
cp -r "$BUNDLE" ./

BUNDLE=`find . -type d -name "*.app"`
cd "$BUNDLE"
cd Contents

# Find current binary
NAME=`find MacOS/ -type f -name "*"`

# remove old program
rm -rf MacOS
mkdir MacOS


#Copy new binary
cp ../../../components/backend/dist/main "$NAME"

#Insert copies of ffmpeg and lighttpd
cp ../../../components/binaries/ffmpeg MacOS/ffmpeg
cp ../../../components/binaries/lighttpd MacOS/lighttpd

#Inserts assets
cd Resources
cp -r ../../../../components/site/dist ./site
cp -r ../../../../components/interface/dist ./app

