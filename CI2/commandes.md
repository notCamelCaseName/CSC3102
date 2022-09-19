# Commandes utilisées
## Exercice 2
<pre><code>
cd $HOME
ls
cd chemin/vers/TP2
pwd
ls ..
ls /chemin/vers/TP1
ls $HOME
mkdir test && cd test
cp /etc/passwd ./
cp passwd passwd2
ls -i
 # Ici, les deux numeros sont differents car ce sont deux fichiers differents qui contiennent la meme chose
mv passwd2 dup
ls -i
 # Les numeros de dup et passwd sont les memes car on a renomme passwd en dup, et non cree un nouveau document
rm passwd
cd .. && rm -fr test
</code></pre>

## Exercice 3
<pre><code>
cd /chemin/vers/TP2
cp /etc/passwd my\_passwd
cat my\_passwd
mkdir Liens
cd Liens
ln ../my\_passwd lien.txt
ls -i ../my\_passwd lien.txt
 # Les numeros sont les memes car les deux documents referencent effecrivement le meme fichier dans la memoire
cat lien.txt
ln -s ../my\_passwd lien\_symb.txt
ls -i ../my\_passwd lien\_symb.txt
cat lien\_symb.txt
mv ../my\_passwd ./
cat lien\_symb.txt
 # Ici, GNU/Linux detecte que le fichier est manquant et nous le signale par une erreur
mv my\_passwd ..
cat lien\_symb.txt
</code></pre>

## Exercice 4
mkdir tmp
chmod 750 tmp
 # Cela correspond a droits de lecture-ecriture-execution pour l'utilisateur, lecture-execution pour le groupe de l'utilisateur et aucun droits pour le reste
cp /etc/hosts tmp/liste\_hosts && chmod 640 tmp/liste\_hosts && cat tmp/liste\_hosts
chmod u-r tmp/liste\_hosts && cat tmp/liste\_hosts
chmod u-w tmp && rm -fr tmp
chmod u-r tmp && ls tmp
chmod u-x tmp && cd tmp
chmod u+rwx tmp
rm -fr tmp
