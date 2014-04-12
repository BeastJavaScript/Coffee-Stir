class Person
  constructor:(@name)->

  speak:->
    console.log "hi my name is #{@name}"

  run:->
    "console.log fast running"



class Child extends Person
  constructor:(name,@age)->
    super(name)


  cry:->
    console.log "cry"

