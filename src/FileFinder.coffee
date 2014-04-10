#include FileScanner.coffee
fs= require("fs");
path = require("path")
{FileScanner}=require("./FileScanner.js")
{Include}=require("./Include.js")

class FileFinder
  constructor:(@path,@watch)->
    @includeStack=[]
    @exec()

  exec:->
    try
      stats=fs.statSync(@getAbsolutePath())
      if stats.isDirectory()
        @directory()
      else if stats.isFile()
        @file()
      else
        throw new Error("No Idea how to Handle file not found")
    catch e
      e=new Error("Files doesn't exist")
      e.required=@path
      throw e

  file:->
    @includeStack ?= []
    @fileScanner= new FileScanner(@getAbsolutePath(),@watch)

    for f in @fileScanner.files
      @includeStack.push new Include(path.resolve(@getDirectory(@getAbsolutePath()),f),@getAbsolutePath())

  getDirectory:(f)->
    path.dirname f

  getAbsolutePath:->
    path.resolve @path

  getRelativePath:->
    normal=path.normalize(@path)
    path.resolve normal

  isAbsolute:->
    normal = path.normalize(@path)
    absolute= path.resolve @path
    normal is absolute

if module? and module.exports
  module.exports.FileFinder=FileFinder