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

echo 0 >$1

while true; do
	read n <$1
	n=$(expr $n + 1)
	echo $n >$1
	sleep 1
done
