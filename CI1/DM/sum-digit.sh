#! /bin/bash

n=$1
res=0

while [ $n -ge 10 ]; do
	res=$(expr $res + $(expr $n % 10))
	n=$(expr $n / 10)
done

res=$(expr $res + $n)

echo $res
