{Stacker}=require("./Stacker")
{Include}=require("./Include")

class List
  constructor:->
    @collection=[]
  append:(parser...)->
    for item in parser
      if item instanceof Stacker
        @appendStack(item)
      else if item instanceof Include
        @appendInclude(item)
    @build()


  appendStack:(stack)->
    for inc in stack.includes
      @appendInclude(inc)

  appendInclude:(include)->
    safe=true
    for item in @collection
      if item.required is include.required and item.caller is include.caller
        safe=false
    if safe
      @collection.push include



  build:->
    @graph=[]
    bronze=[]
    silver=[]
    gold=[]
    for inc in @collection
      bronze.push inc.caller
    for inc in @collection
      silver.push inc.required
    for g in silver
      unless g in bronze
        gold.push g

    @graph.push b for b in bronze
    @graph.push s for s in silver
    @graph.push g for g in gold
    @filter()

  filter:->
    temp=[]
    for file in @graph
      if file in temp
        @remove(temp,file)
      temp.push(file)

    @graph= temp

  remove:(array,value)->
    array.splice(array.indexOf(value),1)



if module? and module.exports?
  module.exports.List=List


