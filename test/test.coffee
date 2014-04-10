{Include,Stacker,List}=require("../bin/application")

{TestCase,TestResult}=require("beast-test")

new class TestParser extends TestCase
  constructor:->
    super()

  base:->
    console.log "___________BASE____________________"
    inc=new Include("number1.js","number2.js")
    inc2=new Include("shavauhn.js","number1.js")
    inc5=new Include("node.js","jquery.js")
    inc4=new Include("node.js","shavauhn.js")
    inc3=new Include("jquery.js","number2.js")

    stack= new Stacker inc, inc2
    list= new List()
    list.append(stack,inc5,inc4,inc3)
    [inc,inc2,stack,list]


  testRequiredSet:(parser)->
    @assertEquals(parser.required,"number1.js")

  testCallerSet:(parser)->
    @assertEquals(parser.caller,"number2.js")

  testStacker:(inc1,inc2,stack)->
    @assertEquals(stack.includes.length,2)
    @assertEquals(stack.includes,[inc1,inc2])

  testList:(inc1,inc2,stack,list)->
    @assertEquals(stack.includes.length,2)
    @assertEquals(list.graph.length,5)




new class TestOrder extends TestCase
  constructor:->
    super()

  base:->
    inc=new Include("number1.js","number2.js")
    inc2=new Include("shavauhn.js","number1.js")
    inc3=new Include("node.js","jquery.js")
    inc4=new Include("node.js","people.js")
    inc5=new Include("people.js","gabay.js")
    inc6=new Include("node.js","shavauhn.js")
    inc7=new Include("sky.js","sun.js")
    inc8=new Include("people.js","shavauhn.js")
    inc9=new Include("node.js","shavauhn.js")
    inc10=new Include("jquery.js","number2.js")

    stack= new Stacker inc, inc2
    list= new List()
    list.append(stack,inc5,inc4,inc3,inc6,inc7,inc8,inc9,inc10)
    list

  testListOrder:(list)->
    @assertTrue(list.graph.indexOf("number1.js") > list.graph.indexOf("number2.js"))
    @assertTrue(list.graph.indexOf("shavauhn.js") > list.graph.indexOf("number1.js"))
    @assertTrue(list.graph.indexOf("node.js") > list.graph.indexOf("jquery.js"))
    @assertTrue(list.graph.indexOf("node.js") > list.graph.indexOf("people.js"))
    @assertTrue(list.graph.indexOf("people.js") > list.graph.indexOf("gabay.js"))
    @assertTrue(list.graph.indexOf("node.js") > list.graph.indexOf("shavauhn.js"))
    @assertTrue(list.graph.indexOf("sky.js") > list.graph.indexOf("sun.js"))
    @assertTrue(list.graph.indexOf("people.js") > list.graph.indexOf("shavauhn.js"))
    @assertTrue(list.graph.indexOf("node.js") > list.graph.indexOf("shavauhn.js"))
    @assertTrue(list.graph.indexOf("jquery.js") > list.graph.indexOf("number2.js"))


console.log TestCase.getResult()