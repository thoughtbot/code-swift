Type Casting
-----
Check to see if something is a certain type. We still can't really use
type-specific things here.

~~~swift
var thing: Any = "Hi there"
if thing is String {
  println(thing)
}
~~~

Better to test and at the same time get a new, properly typed constant we can
use.

~~~swift
if let string = thing as? String {
  println(string)
}
~~~

If you ever need to cast *upwards*, you can do it with a plain `as`:

~~~swift
let s2 = "Foo"
count(s2)
let o2 = s2 as Any
// count(o2)       // wouldn't work, compiler doesn't believe this is a string
~~~

