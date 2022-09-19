#! /bin/bash

if [ $# -lt 2 ]; then
	echo "Erreur : Pas assez d'arguments"
	./readme.sh
fi

case $1 in
	len)
		op=l;;
	mir)
		op=m;;
	sum)
		op=s;;
	bin)
		op=b;;
	dec)
		op=d;;
	int)
		op=i;;
	*)
		op=$1;;
esac

shift

args="$@"

for arg in $args; do
	isnum="$(expr 0 + "$arg" 2>/dev/null)"
	if [ -z "$isnum" ]; then
		echo Erreur : $arg n\'est pas un entier
		./readme.sh
	elif [ $isnum -lt 0 ]; then
		echo Erreur : $arg n\'est pas un entier positif
		./readme.sh
	else
		case $op in
			l) ./len.sh $arg;;
			m) ./mirror.sh $arg;;
			s) ./sum-digit.sh $arg;;
			d) ./decimal_to_binary.sh $arg;;
			b) ./binary_to_decimal.sh $arg;;
			i) while [ 1 ]; do
				read op args
				if [ $op = "c" ]; then exit
				else ./num.sh $op $args
				fi
			done;;
			*) echo Erreur : opération inconue; ./readme.sh;;
		esac
	fi
done
