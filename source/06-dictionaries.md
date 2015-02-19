Dictionaries
-----
Dictionaries are also type-safe, and are created similarly to arrays.

~~~swift
var d1 = [String : String]()
var d2 = ["foo" : "FOO", "bar" : "BAR"]
~~~

If a dictionary is mutable, like the ones we created using `var`, you can change
them.

~~~swift
d1["hey"] = "you"
~~~

Dictionary iteration is also a piece of cake.

~~~swift
let d = ["answer" : "42",
         "question" : "UNKNOWN"]
for (key, value) in d {
    println("The \(key) is \(value)")
}
~~~

Unlike arrays, dictionaries don't have methods like `map` and `filter`. They do
however have properties `allKeys` and `allValues`, which can be iterated.
