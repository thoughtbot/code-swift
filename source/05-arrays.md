Arrays
-----
Arrays in Swift are type-safe. You can create an empty array by 
specifying the type of its items in square brackets, followed by 
parens to call the array initializer.
You can create a non-empty array just by listing its contents. The array type
will be inferred by the compiler (in this case, it's an array of `String`s)
~~~swift
  var a1 = [String]()
  var a2 = ["How", "you", "doin'"]
~~~

Arrays that are mutable, like the `var`s above, can be modified.

~~~swift
a1.extend(["This", "and", "That"])

a2[0] = "What"
a2.append("Bro")
~~~

Iteration
-----

Array iteration is very simple. Note the type inference again, which means we
don't have to specify a type for `name`.

~~~swift
  for name in ["Garfunkel", "Oates"] {
      println("Time for some \(name)")
  }
~~~

Map
-----
Another option is the `map` function. This works a lot like ruby, etc. `map` is
mainly used to construct a new array from an existing array, rather than
producing side-effects such as output.

~~~swift
  // This works...
  ["Simon", "Garfunkel"].map { name in
    println("How about some \(name)")
  }

  // But this is closer to the "spirit" of map,
  // and returns an array of strings
  ["Simon", "Garfunkel"].map { name in
    "How about some \(name)"
  }
~~~

`map` uses generics to do its work. That way it works with arrays of any type,
and you never need to specify the type of the inner value (like `name` above).
It looks like this:

~~~
    /// Return an `Array` containing the results of calling
    /// `transform(x)` on each element `x` of `self`
    func map<U>(transform: (T) -> U) -> [U]
~~~

Filter
-----

Along those same lines, an array can be `filter`ed to produce a new array
containing just some of the original arrays values. Specifically, those values
for which the block returns `true`. Here we are grabbing just the values of the
array which match a specific name.
~~~swift

  // filter
  ["Simon", "Garfunkel"].filter { name in
      name == "Simon"
  }
~~~

`filter` also uses generics. It looks like this:
~~~
    /// Return an `Array` containing the elements `x` of `self` for which
    /// `includeElement(x)` is `true`
    func filter(includeElement: (T) -> Bool) -> [T]
~~~

Reduce
-----
Yet another interesting array operation is `reduce`. If you've ever created a
temporary variable to accumulate values while iterating over an array, `reduce`
can save you a few steps.
~~~swift

  // reduce
  ["Simon", "Garfunkel"].reduce("") { combo, next in
      if combo == "" {
          return next
      } else {
          return "\(combo) and \(next)"
      }
  }
~~~

Once again, generics are at work here.
~~~
    /// Return the result of repeatedly calling `combine` with an
    /// accumulated value initialized to `initial` and each element of
    /// `self`, in turn, i.e. return
    /// `combine(combine(...combine(combine(initial, self[0]),
    /// self[1]),...self[count-2]), self[count-1])`.
    func reduce<U>(initial: U, combine: (U, T) -> U) -> U
~~~

