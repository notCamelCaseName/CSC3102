#! /bin/bash

res=1
n=$1
while [ $n -ge 9 ]; do
	res=$(expr $res + 1)
	n=$(expr $n / 10)
done
echo $res
