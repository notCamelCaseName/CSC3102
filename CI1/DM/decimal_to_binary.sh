#! /bin/bash

n=$1
res=""

while [ $n -ge 2 ]; do
	res=$res$(expr $n % 2)
	n=$(expr $n / 2)
done

if [ $(expr $1 % 2) -eq 0 ]; then
	echo $(./mirror.sh $res$n)0
else
	echo $(./mirror.sh $res$n)
fi
