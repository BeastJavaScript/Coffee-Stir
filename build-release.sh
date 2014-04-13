#!/bin/sh

basedir=$(dirname $0)
cd $basedir
coffee -wc -o bin src/*.coffee