#!/bin/bash

if [ ! -n "$1" ]
then
	echo "Usage: `basename $0` <process name>"
	exit $E_BADARGS
fi

for i in `pidof $1`
do
	lsof -p $i | head -n 2 | tail -n 1 | awk '{print $2 " " $9}'
done
