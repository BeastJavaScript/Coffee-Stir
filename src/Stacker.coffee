

###
  This class is to compile the Stacked Parser Files
###
class Stacker

  ###
    @property includes [Array<Parser>,Parser] This is the parser files that need to be included
  ###
  constructor:(includes...)->
    if includes instanceof Array
      for inc in includes
        @includes=includes

  includes:[]

  addIncludes:(more)->
    for file in more
      @includes.push(file)

  stack:->
    list= new List()

    for include in @includes
      list.append(include)

if module? and module.exports?
  module.exports.Stacker=Stacker