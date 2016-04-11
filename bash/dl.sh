#!/bin/bash

dl=$( (
for a in "$@"; do
	if echo "$a" | grep -q \- ; then
		x=`echo "$a" | cut -d\- -f1`
		y=`echo "$a" | cut -d\- -f2`
		seq $x $y
	else
		echo $a
	fi;
done;
) | sort -n -u )" f"

n=0

while read l; do
	n=$(($n+1))
	if echo "$dl" | grep "^$n" -q -w ; then 
		dl=$( echo $dl | cut -d\  -f1 --complement )
		if test "$dl" == "f"; then
			break
		fi
		continue
	fi;
	echo $l;
done;

cat
