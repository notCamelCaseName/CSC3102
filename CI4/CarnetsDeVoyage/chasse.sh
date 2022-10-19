#! /bin/bash

base=~/Cours/CSC3102/CI4/CarnetsDeVoyage

size=0

for file in $base/19[7-9][[:digit:]][_-][[:upper:]]*; do
	if [ -d $file ]; then
		cur=$(du -d0 $file | cut -f1)
		if [ $size -lt $cur ]; then
			size=$cur
			rep=$file
		fi
	fi
done

for file in $(find $rep -name "*Itineraire*" -type f); do
	if grep -q Bilbon $file; then
		if [ "$(grep à $file | sort | head -n3 | cut -b1 | tr "\n" " ")" = "C E L " ]; then
			cle=$file
		fi
	fi
done

echo "" >Itineraire_trie.txt

sort -k 3 $cle | while read line ; do
	if echo $line | grep -q '...*' ; then
		echo $line >>Itineraire_trie.txt
	fi
done

head -n 3 Itineraire_trie.txt > Itineraire_trie_compact.txt
tail -n 2 Itineraire_trie.txt >> Itineraire_trie_compact.txt

mots=""
while read line; do
	mots=$mots" "$(echo $line | cut -d " " -f 3)
done < Itineraire_trie_compact.txt

tresor=""

for mot in $mots; do
	tresor=$tresor"/"$mot
done

echo $tresor
cat $base$tresor
