Classes
-----
Declaring a class is simple. For starters, you just name it, specify 
its parent class (if any) and any protocols it should conform to.
Building iOS or  OS X apps, you will often, but not always, have a parent 
class.

Like in Objective-C, Swift classes can only inherit from a single 
parent class, but can inherit interfaces using protocols.  (We’ll get 
to protocols soon)

~~~swift
import Foundation

class CopyThing: NSObject, NSCopying {
    func copyWithZone(zone: NSZone) -> AnyObject {
        return CopyThing()
    }
}
~~~

Properties
-----

Frequently, classes will have properties. You can give them initial 
values when declaring them. You can choose to make them variables or 
constants. If they're constants, then the compiler forces you to give them an
initial value in some way, either in their declaration or in an initializer.

~~~swift
class Thing {
    var foo : Int = 2
    let bar : Int = 3
}
~~~

Here's how to set them up using an initializer.
~~~swift
class AnotherThing {
    var foo : Int
    let bar : Int
    init() {
        foo = 2
        bar = 3
    }
}
~~~
That example is made very simple by the fact that `AnotherThing` has no parent
class. Like Objective-C, 
each class can have multiple initialisers. In Swift, you can specify 
that some initialisers are required and others are not, which affects 
what subclasses must implement. This actually gets a little 
complicated, and we'll get back to this topic later.

Computed Properties
-----
You can also define a property with an inline code block. This is 
then callable with dot-syntax, with no parentheses, like any other 
property.
A property created this way has no underlying value of its own, and 
is called a *computed property*
~~~swift
class FooBar {
    var foo : Int = 2
    let bar : Int = 3
    var fooPlusBar : Int {
        return foo + bar
    }
}

let sum = FooBar().fooPlusBar
~~~
You can also provide both a getter and a setter for a computed 
property, like this.
~~~swift
class UltimateFooBar {
    var foo : Int = 2
    let bar : Int = 3
    var fooPlusBar : Int {
        get {
            return foo + bar
        }
        set {
            foo = newValue - bar
        }
    }
}
let ultimateFooBar = UltimateFooBar()
ultimateFooBar.fooPlusBar = 20
~~~
Methods
-----
And of course, you can define methods for your classes. Also 
callable with dot-syntax, and unlike properties, method calls must have parentheses (even when calling 
a method with no parameters).
~~~swift
class Multiplier {
    var foo = 23
    var bar = 5
    func product () -> Int {
        return foo * bar
    }
}

Multiplier().product()
~~~
And, there's that same pattern we've seen elsewhere. There's a 
nice sort of symmetry between the syntaxes for functions, methods, 
and closures.
~~~
(<list of param types>) -> <return type>
~~~

Method Parameters
-----
One slight difference between methods and functions is the way that named
parameters are used. Normally, when calling a method, the first parameter name is 
omitted, but the others are used.
~~~swift
class ParamThing {
    func combine(string1: String, string2: String) -> String {
        return string1 + string2
    }
}

ParamThing().combine("a", string2:"b")
~~~
The reason for this seems to be involved with Objective-C. For example, an Objective-C method
like this:

~~~
- (NSRange)rangeOfData:(NSData *)dataToFind
               options:(NSDataSearchOptions)mask
                 range:(NSRange)searchRange
~~~

Now looks like this in Swift:

~~~
func rangeOfData(_ dataToFind: NSData,
         options mask: NSDataSearchOptions,
           range searchRange: NSRange) -> NSRange
~~~
It would be weird to call something like `myData.rangeOfData(dataToFind:
otherData, ...`, so the first parameter name is omitted. As if to underline
this, in this example the first parameter is prepended with an underscore
character, which means "no external name". This is another point we haven't
explored yet: Each parameter can have *two* names! The one used externally by
callers, and the one used internally within the method. This takes some getting
used to.

