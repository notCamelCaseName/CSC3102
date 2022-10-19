#! /bin/bash

trap 'echo $$: Morituri te salutant; exit 0' USR1
trap './cesar.sh' INT
trap 'cesar.sh' TERM

if [ $# -ne 1 ]; then
		echo "Usage: $0 N"
		exit 1
fi

echo $$ >>arene.txt

if [ -z "$pidInitial" ]; then
		export pidInitial
		pidInitial=$$
fi

echo "Processus $$ démarre avec le processus initial $pidInitial"

if [ $1 -gt 1 ]; then
		K=$(expr $1 - 1)
		echo "  Il reste $K processus à créer"
		$0 $K &   # $0 est le nom du script, ça permet de ne plus dépendre de ce nom
else
		echo "  Fin de chaîne"
fi

while true; do
	echo $$ Ave César
	sleep 5 &
	wait $!
done

echo "Processus $$ termine"

exit 0
