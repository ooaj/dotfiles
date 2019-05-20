#!/bin/bash
read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
ffmpeg -video_size 1024x768 -framerate 25 -f x11grab -i :0.0 /tmp/output.mp4
