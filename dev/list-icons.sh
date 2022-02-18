#!/bin/bash

HERE="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"

find /usr/share/icons/{Mint-X,Mint-Y,Adwaita,gnome,hicolor,locolor,HighContrast} \
    \( -name \*.png -o -name \*.svg \) \
    | "$HERE/basenames.rb" \
    | sort \
    | uniq
