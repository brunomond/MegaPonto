#!/bin/bash
cd ..
git pull
lista=`git branch -r --merged`
branchs=`echo ${lista} | sed "s/origin['/']//g" | sed "s/HEAD -> //g" | sed "s/master//g" | sed "s/dev//g"`
arr=($branchs)
for i in "${arr[@]}"
	do
		git branch -d $i
		git push origin --delete $i
		git checkout -b $i
		git pull
		git merge dev
		git add .
		git commit -m'reset da branch ${i} com dev'
		git push origin $i
		git checkout dev
	done
