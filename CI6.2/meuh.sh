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
	pred="tube-$$-1"
else
	pred="tube-$pidInitial-$(expr $1 + 1)"
fi

succ="tube-$pidInitial-$1"

mkfifo $succ

echo "Processus $$ démarre avec $pred et $succ"

if [ $1 -gt 1 ]; then
	K=$(expr $1 - 1)
	echo "  Il reste $K processus à créer"
	gnome-terminal -- "$PWD/meuh.sh" "$K" &   # $0 est le nom du script, ça permet de ne plus dépendre de ce nom
else
	echo "  Fin de chaîne"
fi

while [ ! -e $pred ]; do
	sleep .1
done

exec 3<>$pred
exec 4<>$succ

if [ $1 -eq 1 ]; then
       echo Meuh >&4
fi       

while true; do
	read msg <&3
	echo $$ : $msg
	sleep 1
	echo $msg >&4
done

echo "Processus $$ termine"

exit 0
