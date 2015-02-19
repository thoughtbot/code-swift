Tuples
-----
Tuples are similar to tuples in many other language, and can be 
useful when creating a function that needs to return multiple values.

~~~swift
var t = (23, 42, "foo")
var i = t.0            // 23
//t.2 = 100            // error!
t.2 = "bar"            // (23, 42, "bar")
~~~
Unlike arrays, objects in a tuple can be of different types. But when changing a
value in a tuple, you can't change it to one of another type.
