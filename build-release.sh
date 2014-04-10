#!/bin/sh

cd src
coffee -c -j ../bin/cli.js Include.coffee Stacker.coffee Filescanner.coffee FileFinder.coffee List.coffee Main.coffee
