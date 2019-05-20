#!/bin/bash
pls="$(xclip -o )"
echo $pls
mpv $pls

