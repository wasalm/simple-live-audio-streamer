#!/bin/bash

# Get path of this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Change directory to site folder
cd "$DIR";
cd ../

# Empty build folder
rm -rf dist
mkdir dist

cd dist
