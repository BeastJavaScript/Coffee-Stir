#!/bin/sh

basedir=$(dirname $0)
cd $basedir
coffee -c -o bin src/*.coffee