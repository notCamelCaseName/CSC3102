#! /bin/bash

K=$1

if [ -z "$pidInitial" ]; then
	export pidInitial
	pidInitial=$$
fi

echo Le processus $$ démarre avec comme processus initial $pidInitial

if [ $K -eq 0 ]; then
	echo Le processus se termine avec $$
	exit
else
	./chaine.sh $(expr $K - 1)
fi
