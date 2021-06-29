#!/bin/bash

# Get path of this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Change directory to site folder
cd "$DIR";
cd ../components/interface

# Empty build folder
rm -rf dist
mkdir dist

cd dist

mkdir assets
cd assets

cp -r ../../src/assets/images ./images;
cp -r ../../node_modules ./node_modules;

mkdir scripts
mkdir stylesheets

cd ..

uglifyjs \
	../src/assets/scripts/app.js \
	../src/assets/scripts/settings.js \
	../src/assets/scripts/bindings.js \
	-c -m -o assets/scripts/app.min.js 

cleancss -o assets/stylesheets/app.min.css \
	../src/assets/stylesheets/site.css \
	../src/assets/stylesheets/main.css \
	../src/assets/stylesheets/card-right.css \
	../src/assets/stylesheets/card-left.css \
	../src/assets/stylesheets/settings.css 


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
