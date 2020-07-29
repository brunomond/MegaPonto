#!/bin/bash
cd ..
git pull
git checkout dev
git pull
echo '------------------ MERGE JEFF ----------------------'
git merge origin/jeff
git mergetool
git add .
git commit -m'merge dev 1/3'
echo '------------------ MERGE KAZUO ----------------------'
git merge origin/kazuo
git mergetool
git add .
git commit -m'merge dev 2/3'
echo '------------------ MERGE BRUNO ----------------------'
git merge origin/bruno
git mergetool
git add .
git commit -m'merge dev 3/3'
echo '------------------ FIM DO MERGE ----------------------'
git push origin dev