#! /bin/bash

if [ $# -ne 2 ]; then
	echo "Nombre d'arguments invalide"
	exit 1 >&2
elif [ ! -e $1 ]; then
	echo "Le fichier n'existe pas"
	exit 2 >&2
elif [ -d $1 ]; then
	echo "C'est un repertoire"
	exit 3 >&2
fi

while read line; do
	num=0
	for car in $line; do
		if [ $num -eq $2 ]; then
			echo $car
		fi
		num=$(expr $num + 1)
	done
done <$1
