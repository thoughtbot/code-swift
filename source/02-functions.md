Functions
-----

When declaring functions the return type, instead of being on the left, is pushed off to the right, after an arrow.
You’ll see this pattern repeated later.

Calling functions looks a lot like it does in most other languages.

~~~swift
  func addInts(n1 : Int, n2 : Int) -> Int {
      return n1 + n2
  }

  addInts(23, 42)
~~~
Notice this pattern:

~~~swift
  (<list of param types>) -> <return type>
~~~

Named Parameters
-----

Functions always have named parameters, but you normally omit the names.
An exception: If you precede the parameter name with `#` then it must be
included.

~~~swift
  func doThings(#thing: Int) -> String {
    return "Just a thing"
  }

  //doThings(42)       // <- This causes an error
  doThings(thing:42)
~~~

Parameter names can also be used to distinguish between methods.

~~~swift
  func doThings(thing1: Int, thing2: Int) -> String {
    return "Things are two Ints"
  }

  func doThings(#thing3: Float, #thing4: Float) -> String {
    return "Things are two Floats"
  }

  doThings(23, 47)
  doThings(thing3:23, thing4:47)
~~~

That calls the first `doThing()` function, since the arguments are integers.
Note that it's perfectly OK to have multiple functions with the same name, as
long as the signatures are different.

Closures
-----

Creating a closure is very simple. Especially compared to blocks in
Objective-C, which are basically equivalent.
We create a closure, and call it just like a function.

~~~swift
  var add = {(n1: Int, n2: Int) -> Int in
      return n1 + n2
  }

  add(23, 42)
~~~

There's that pattern again:

~~~swift
  (<list of param types>) -> <return type>
~~~

Of course the big difference is that a closure can capture a copy of any value
in its defining scope.

~~~swift
  let prefix = "Dr. "

  let doctorator = {(s: String) -> String in
    return prefix + s
  }

  let drPepper = doctorator("Pepper")
~~~

Another finesse of closures is that the keyword `return` can be skipped for
one-line closures, so we could redefine the previous example more concisely.
We'll see more of this later.

Also, if the last parameter to a function is a closure, then that closure can be
placed *outside* the parentheses. This looks a lot like ruby. In general, it
ends up looking something like this, where `fetch` takes a query and a
completion handler:

~~~swift
  fetch(query) { result in
    println("I got result \(result)!")
  }
~~~

We'll see some real examples of this later.
