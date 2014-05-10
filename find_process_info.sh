#!/bin/bash

# If you only need to know the PID of a process,
# you will probably want to use "pgrep -lf <process>" and be done with it.
# This served me well when I had a bunch of processes with the same name,
# but started in different folders, and I had to kill only some of
# them according to the folder.
# Therefore I only select the second and ninth column of the
# "lsof -p" output.

if [ ! -n "$1" ]
then
	echo "Usage: `basename $0` <process name>"
	exit $E_BADARGS
fi

for i in `pidof $1`
do
	lsof -p $i | head -n 2 | tail -n 1 | awk '{print $2 " " $9}'
done
