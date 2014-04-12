class Person
  constructor:(@name)->

  speak:->
    console.log "hi my name is"

  walk:->
    "console.log walking"



class Child extends Person
  constructor:(name,@age)->
    super(name)




