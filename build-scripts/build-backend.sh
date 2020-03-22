#!/bin/bash

# Get path of this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Change directory to site folder
cd "$DIR";
cd ../components/backend

# Empty build folder
rm -rf dist
mkdir dist

cd src
c++ -std=c++17 \
	lib/json.cpp \
	class/config.cpp \
	class/file-paths.cpp \
	class/background-service.cpp \
	bindings.cpp \
	main.cpp \
	-framework WebKit -o ../dist/main