#include Person.coffee

class Child extends Person
  constructor:(name,@age)->
    super(name)


  cry:->
    console.log "cry"
