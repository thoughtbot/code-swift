Structs
-----

Structs look pretty similar to classes. One big difference, compared 
to a class, is that each struct has an initializer created for it automatically.

~~~swift
import UIKit
struct Rectangle {
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
}

Rectangle(x: 500, y: 500, width: 100, height: 100)
~~~

That makes them pretty nice to use as simple data holders. But there's more!

In Swift, structs are much richer than their C counterparts. The 
elements they contain are actually properties, and can be set up 
just like in classes. They can be variables or constants, they can be computed
properties, etc.

Also, structs are able to contain methods, conform to protocols, and can have their functionality enhanced with extensions.

Any methods that modify a struct must be marked with the “mutating” keyword.
Since the compiler knows whether a particular struct is a variable or a
constant, it can determine at compile-time whether it should allow use of
mutating methods or not.

~~~swift
extension Rectangle {
    var area: CGFloat {
        return width * height;
    }
    mutating func shift(#dx : CGFloat, dy: CGFloat) {
        x += dx
        y += dy
    }
}
var r = Rectangle(x: 100, y: 100, width: 400, height: 400)
r.shift(dx: 40, dy: 0)
~~~

There is no inheritance for structs.

When you call a function or a method that takes a struct as an argument, the semantics are pass-by-value (like primitive types) instead of pass-by-reference (like 
objects). This means that a struct is typically copied when you pass it to a
function or method.

The complex types built into Swift, such as String, Array, and Dictionary, are
all structs instead of objects, carefully designed to look and act like
subclasses of their Foundation Kit counterparts when used in Objective-C code. 
