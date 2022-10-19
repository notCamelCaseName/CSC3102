#! /bin/bash

# Gestion d'erreur
if [ -d $1 ]; then
	echo "Chemin invalide" >&2
	exit 1
fi
if [ $# -ne 1 ]; then
	echo "Nombre d'arguments invalide" >&2
	exit 1
fi

exec 3>$1

while read line; do
	echo $line >&3
	echo $line;
done
