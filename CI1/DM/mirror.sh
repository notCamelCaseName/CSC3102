#!/bin/bash

res=""
n=$1


while [ $n -gt 0 ]; do
	res=$res$(expr $n % 10)
	n=$(expr $n / 10)
done

echo $res
