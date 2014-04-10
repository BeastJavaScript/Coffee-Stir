Coffee-Stir
==================

![alt](https://raw.githubusercontent.com/BeastJavaScript/Coffee-Stir/master/logo/coffee-stir.png)

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



#License
The MIT License

Copyright (c) 2010-2014 Google, Inc. http://angularjs.org

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.