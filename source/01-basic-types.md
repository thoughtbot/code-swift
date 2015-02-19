Basic Types
-----
Swift has a huge list of specific integer types, and a few different float types.
Probably just use Int and Float most of the time.
Also built-in String, Array, Dictionary, Tuple, and Set types. (which we’ll get back to later)

  Int, Int8, Int16, Int32, Int64, UInt, UInt8, UInt16, UInt32, UInt64
  Float, Float32, Float64
  String
  Array
  Dictionary
  Tuple

Variables & Constants
-----

Use "var" to create a variable.
Using "let" creates a constant. Can’t be mutated, can’t be reassigned.

~~~swift
var firstName = "Bob"
firstName = "Fred"

let lastName = "Dobbs"
lastName = "Flintstone"
~~~

Constant == Immutable
-----

In Swift, notions of "constant" and "immutable" are in lock-step.
Immutability helps the compiler reason about your code, and therefore
optimize it. Anyone familiar with functional programming will probably
appreciate this.

~~~swift
var helloWorld : String = "Hello"
helloWorld.extend(", World")
helloWorld = "Goodbye"

let hello : String = "Hello"
hello.extend(", World") // error
hello = "Hello, World"  // error
~~~

Type Inference
-----

Swift is strongly-typed, but type inference can tighten up the code.
Any time the compiler knows the type that an expression evaluates to,
 you have the chance to skip specifying the type.

~~~swift
  // Instead of this:
  var f1 : Float = 23.5

  // just do this:
  var f2 = 23.5
~~~

Forcing types
-----

You can’t directly assign some things that would work fine
in C. But you can force it, and type inference can help tighten up the
code in the end.

~~~swift
  // Given:
  var f = 23.5          // f is a Double

  // This doesn’t even work:
  var i1 : Int = f      // error

  // But this does:
  var i2 : Int = Int(f)

  // Even better:
  var i3 = Int(f)
~~~

