#!/usr/bin/env node

chokidar = require('chokidar')
program= require("commander")
fs=require "fs"

program.version("0.0.1")
.option("-v, --verbose","Show messages")
.option("-w, --watch","Watch Files")
.option("-o, --output [value]","The file to output all files in. eg application.js")
.parse(process.argv)

file=[]
if program.args
  file= program.args

list= new List()
fileFinder=[]
added=[];
unadded=[];
recursive=(file)->
  if program.verbose
    console.log "parsing #{file}"
  try
    fileFinder.push new FileFinder(file,program.watch)
  catch e
    console.log "in #{file}, file #{e.required} doesn't exist"
  for f in fileFinder[fileFinder.length-1].includeStack
    arguments.callee(f.required)

process.bundle=->
  for bundle in fileFinder
    for stack in bundle.includeStack
      list.append stack
      if program.watch
        unless stack.required in added
          unadded.push stack.required
        unless stack.caller in added
          unadded.push stack.caller

process.output=->
  unless list.graph
    console.log "Nothing to output?"
    process.exit(0)

  if program.verbose
    console.log "Outputing..."

  if program.output
    fs.writeFile(program.output,"")
  for i in [list.graph.length-1 .. 0]
    item=list.graph[i]
    data=fs.readFileSync(item,{"encoding":"utf-8"})
    if program.output
      if program.verbose
        console.log "writing file #{item}"
      data=data.replace(/# ?include .+/g,"")
      fs.appendFile(program.output,data+"\n")
    else
      console.log data
  console.log "wrote to #{program.output} complete"

if file.length is 0
  console.log "No Input"

watchMaster=null;
watcher=->
  if program.verbose
    console.log "watch has been added"
  if program.watch
    for file in unadded
      unless watcthMaster?
        watchMaster=chokidar.watch(file,{persistent:true})
        watchMaster.on("change",(newfile)=>
          recursive(newfile)
          process.bundle()
          process.output()
        )

      watchMaster.add file
      added.push file
    unadded=[]
    watchMaster.close()

for f in file
  recursive(f)
process.bundle()
process.output()
watcher()

