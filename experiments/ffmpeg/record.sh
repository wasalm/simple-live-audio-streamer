#!/bin/bash
cd ../site/stream/

#Qu-24 desk
#../../ffmpeg/ffmpeg -f avfoundation -i ":1" -acodec libfdk_aac -ac 2 -af "pan=stereo|FL=c0|FR=c0,volume=15dB" -b:a 128k -hls_flags delete_segments -hls_time 15 -hls_list_size 5 -hls_delete_threshold 2 -hls_segment_filename 'file%03d.ts' live.m3u8

#Mic input
../../ffmpeg/ffmpeg -f avfoundation -i ":0" -acodec libfdk_aac -ac 2 -b:a 128k -hls_flags delete_segments -hls_time 15 -hls_list_size 5 -hls_delete_threshold 2 -hls_segment_filename 'file%03d.ts' live.m3u8
