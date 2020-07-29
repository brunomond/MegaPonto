#!/bin/bash
cd ..
git checkout dev
git pull
git merge origin/jeff
git mergetool
git add .
git commit -m'merge dev 1/3'
git merge origin/kazuo
git mergetool
git add .
git commit -m'merge dev 2/3'
git merge origin/bruno
git mergetool
git add .
git commit -m'merge dev 3/3'