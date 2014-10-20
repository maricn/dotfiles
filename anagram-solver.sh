#!/bin/bash

FOUND=0
i=14
while [ $FOUND -eq 0 -a $i -gt 4 ] ; do
	i=$[$i - 1]
	echo $i
	output=$(wordplay $0 -ls -d1 -n$i -m$i -f ~/Documents/sr\ dictionary\ wordlist/sr_lat.dic 2>/dev/null)
	if [[ -n $output ]] ; then
		FOUND=1 ; 
		echo $output
	fi
done

