#!/bin/bash
cd ..
git pull
lista=`git branch -r --merged`
branchs=`echo ${lista} | sed "s/origin['/']//g" | sed "s/HEAD -> //g" | sed "s/master//g" | sed "s/dev//g"`
arr=($branchs)
for i in "${arr[@]}"
	do
		echo $i
	done
