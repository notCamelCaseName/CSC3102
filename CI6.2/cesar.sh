#! /bin/bash

if [ ! -f "arene.txt" ]; then
	exit 1
fi

while read line; do
	kill -USR1 $line
done <arene.txt

rm arene.txt tube-$pidInitial-*
