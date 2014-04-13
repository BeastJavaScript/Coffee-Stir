#!/bin/sh

basedir=$(dirname $0)
cd $basedir

coffee -c -o bin src/*.coffee
git add --all
git commit -am"automatic publish"
git push origin master
