#!/bin/sh
cd src
coffee -c -j ../index.js Include.coffee Stacker.coffee Filescanner.coffee FileFinder.coffee List.coffee Main.coffee
