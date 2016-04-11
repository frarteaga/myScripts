find /media/DATOS/Frank/BAJADO/ -iname '*.htm*' -print0 | xargs -0 -n 1 grep -o -E 'href=\"http://w{0,3}\.?[^\"]{1,}\.[^\"]{1,}\"' | sort -u
