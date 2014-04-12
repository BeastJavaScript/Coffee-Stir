class Person
  constructor:(@name)->

  speak:->
    console.log "hi my name is #{@name}"

  run:->
    "console.log fast running"
