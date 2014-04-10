Coffee-Stir
==================

![alt](../logo/coffee-stir.png)

Coffee-stir is a small nodejs plugin that will allow you to merge CoffeeScript files into one file that you can then compile.


##Getting Started

you can download the package on npm.

    npm install -g coffee-stir
    
    
Inside your files all you need to do it add a simple include.

    #coffeescript file
    #include MyFile.coffee "text here is ignored. Write a label"
    
To use in the command line you can type the following

    coffee-stir <myfile.coffee>
    
    example
    
    coffee-stir greatest-file.coffee
    
    
<br>

This will load the file greatest-file and parse it for include.
The parse will parse file and align them so that the dependecies are in the correct order for the final file




##Options

use -o <filename.coffee>
This will place the merge files into the following file

    example
    
    coffee-stir -o ../someFolder/merged.coffee
    
    other examples

You can set it to watch the files as well

    coffee-stir -wo ../someFolder/merged.coffee

Options are 

-v --verbose

-o --output

-w --watch


You can have multiple files

coffee-stir <file1> <file2> <file3>

    
new files that are included with an include will be parsed as well




    
    


###Notes

coffee-stir is the part of the a library from BeastJavaScript
BeastJavaScript created by Shavauhn Gabay