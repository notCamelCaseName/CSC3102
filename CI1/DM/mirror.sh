#!/bin/bash

res=$(expr $1 % 10)
n=$(expr $1 / 10)


while [ $n -gt 0 ]; do
	res=$(expr $res \* 10)
	res=$(expr $res + $(expr $n % 10) )
	n=$(expr $n / 10)
done

echo $res
