#! /bin/bash

if ( [ $# -lt 2 ] && [ "$1" != "i" ] && [ "$1" != "int" ] ); then
	echo "Erreur : Pas assez d'arguments"
	./readme.sh
	exit 1
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

if [ $op = i ]; then
	interactive=true
	read op args
fi

while true; do
	for arg in $args; do
		isnum="$(expr 0 + "$arg" 2>/dev/null)"
		if [ -z "$isnum" ]; then
			echo Erreur : $arg n\'est pas un entier positif
			./readme.sh
			exit 2
		elif [ $(expr $arg % 1) -ne 0 ]; then
			echo Erreur : $arg n\'est pas un entier positif
			./readme.sh
			exit 2
		elif [ $isnum -lt 0 ]; then
			echo Erreur : $arg n\'est pas un entier positif
			./readme.sh
			exit 2
		else
			case $op in
				l) 	./len.sh $arg;;
				m) 	./mirror.sh $arg;;
				s) 	./sum-digit.sh $arg;;
				d) 	./decimal_to_binary.sh $arg;;
				b) 	./binary_to_decimal.sh $arg;;
				*) 	echo Erreur : opération inconue
					./readme.sh
					exit 3;;
			esac
		fi
	done

	if [ $op = c ]; then
		interactive=false
	fi
	
	if [ $interactive = true ]; then
		read op args
	else
		break
	fi
done
