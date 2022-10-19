#! /bin/bash

while read line1 <$1 && read line2 <$2; do
	echo $line1
	echo $line2
done
