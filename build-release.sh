#!/bin/sh

basedir=$(dirname $0)
cd $basedir
coffee -c -o bin src/Main.coffee src/FileFinder.coffee src/FileScanner.coffee src/Include.coffee src/List.coffee src/Include.coffee src/Stacker.coffee src/List.coffee