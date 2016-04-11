#! /bin/bash

find -type f . 

find . -iname '*.zip' -print -execdir zipinfo -1 {} \;

find . -iname '*.t*gz' -print -execdir tar -tf {} \;

find . -iname '*.tar.bz2' -print -execdir tar -tf {} \;

find . -iname '*.rar' -execdir unrar l {} \;

find . -iname '*.7z' -execdir 7zr l {} \;
