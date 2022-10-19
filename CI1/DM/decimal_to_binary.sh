#! /bin/bash

n=$1
res=""

while [ $n -ge 2 ]; do
	res=$(expr $n % 2)$res
	n=$(expr $n / 2)
done

echo $n$res
