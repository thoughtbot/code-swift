Generics
-----

This `add` function is really too specific. If we try to use it with anything but
`Int` values, it won't compile.

~~~swift
  func add(n1: Int, n2: Int) -> Int {
      return n1 + n2
  }

  //add(UInt8(23), UInt8(123)) // Error!
~~~

But, we can create a generic version that accepts any integer type:

~~~swift
  // then, define this:
  func add<T: IntegerType>(n1: T, n2: T) -> T {
      return n1 + n2
  }

  add(UInt8(23), UInt8(123)) // OK!
~~~

With generics, we solved this by creating a new function that 
declares a generic type, here called T, to be used for the parameters 
and return value.
In this case, we’re declaring that the type T can’t be just *anything*, it 
has to be a type that conforms to the IntegerType protocol. (we’ll get to 
protocols a little later).


If you're familiar with how generics work in C# or other languages, or even
templates in C++, this is pretty similar.

Generics don't seem to incur a compile-time penalty like C++ templates do.
Functions that use generics seem to work like any other function, just with a
different set of constraints for the compiler.
