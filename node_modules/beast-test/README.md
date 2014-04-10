Beast Javascript TestSuite
--------------------------

###### create by shavauhn gabay

<br>

This framework was create to bring a more elegant syntax to Unit Testing in CoffeeScript / Javascript. The aim was to get the code as readible as possible but still allow users to create testcase rapidly and test their application.


####Examples

Inorder to create a new Test class just extend the TestCase class

    #coffeescript

    MyTest extends TestCase

      constructor:->
        super()     #the super must be called


    #base object that is passed to every test method
      base:->
        {
          fname:"Shavauhn"
          lname:"Gabay"
        }


If you want to pass multiple items then you can pass them in an array


    #coffeescript

    MyTest extends TestCase

      constructor:->
        super()     #the super must be called


    #This will pass two items to the test methods
      base:->
        someItem="hello"
        obj = {
          fname:"Shavauhn"
          lname:"Gabay"
        }

        return [someItem,obj]




To defined a test method it is rather easy just name it test_____________ and fill it with what ever name you want.


        #coffeescript

    MyTest extends TestCase

      constructor:->
        super()     #the super must be called


    #base object that is passed to every test method
      base:->
        someItem="hello"
        obj = {
          fname:"Shavauhn"
          lname:"Gabay"
        }

        return [someItem,obj]

      testGiveMeBase:(someItem,obj)
        @assertEquals(someItem,"hello") #true

from here on out you can check the [API](http://beastjavascript.github.io/TestSuite/doc/) and the [Youtube](http://youtu.be/npgqeC_FyXM) video for more instructions
