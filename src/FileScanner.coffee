
fs= require "fs"

class FileScanner
  constructor:(@path,@watch)->
    @files=[]
    @fileExt=["coffee","js"]
    @fileExt=@fileExt.join("|")

    @scan()


  scan:()->
    data=fs.readFileSync(@path,{encoding:"utf-8"})
    @lines=data.split("\n")
    @parse()
    @complete()


  parse:()->
    FileScanner.test ?= new RegExp("\ *?#include .*")
    for line in @lines
      @result= FileScanner.test.exec(line)
      if @result isnt null
        @mark(@result)

  mark:(result)->
    FileScanner.resultTest= new RegExp("[^ ]+\.(#{@fileExt})")
    fileWatch=FileScanner.resultTest.exec(result)
    if fileWatch
      try
        fs.statSync(fileWatch[0])
        @files.push(fileWatch[0])
      catch e
        console.log "in #{@path} : included file #{fileWatch[0]} doesn't exist"

  complete:->

if module? and module.exports?
  module.exports.FileScanner=FileScanner
