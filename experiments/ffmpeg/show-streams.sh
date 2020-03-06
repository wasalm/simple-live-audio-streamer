#!/bin/bash
cd ../site/stream/
ffprobe -f avfoundation -i ":1" -show_streams -select_streams a:0
