#! /bin/bash

res=0
n=$1

while [ $n -gt 0 ]; do
	res=$(expr $res \* 2)
	res=$(expr $res + $(expr $n % 2))
	n=$(expr $n / 2)
