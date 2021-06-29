#!/bin/bash

# Get path of this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Change directory to site folder
cd "$DIR";
cd ../components/site

# Empty build folder
rm -rf dist
mkdir dist

cd dist

mkdir assets
cd assets

cp -r ../../src/assets/images ./images;

mkdir scripts
cd scripts

uglifyjs \
	../../../src/assets/scripts/audio-player.js \
	../../../src/assets/scripts/load.js \
	../../../src/assets/scripts/share.js \
	-c -m -o app.min.js 

cd ..
mkdir stylesheets
cd stylesheets

cleancss -o app.min.css \
	../../../src/assets/stylesheets/site.css \
	../../../src/assets/stylesheets/card.css

cd ../../

html-minifier \
	--collapse-whitespace \
	--remove-comments \
	--remove-optional-tags \
	--remove-redundant-attributes \
	--remove-script-type-attributes \
	--remove-tag-whitespace \
	--use-short-doctype \
	--input-dir ../src/ \
	--output-dir ./ \
	--file-ext html
