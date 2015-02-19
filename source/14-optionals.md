Optionals
-----

Up to this point, nothing we've done has included any nil values. Normal
variables and constants in Swift can't contain a nil at all! If you need to
allow for the possibility of holding onto nothing, you'll need to use optionals.

This point is really a head-scratcher for many people at first.
Optionals are similar to the “maybe monad” in Haskell.
An optional can either contain some value, or contain none at all. If 
you were to define it in code, it might look something like this.

~~~swift
enum Optional<T> {
    case None
    case Some(T)
}
~~~
It's an enum type that either contains nothing, or contains a value.
But you don't need to define it, it's already there and deeply 
embedded in the language. Any type that is followed immediately 
by a question-mark becomes an optional-wrapped type.

~~~swift
var nonOptionalString: String
var optionalString: String?
~~~
So, what is the use of this?

With optionals, you can make your code explicitly do one thing or another. And you
can build your applications so that the core of what you're doing is all
centered on *non*-optional values, by holding any optional values (allowing for
empty user inputs, missing files or remote data, etc) out at the edges.

Unlike Objective-C, where only pointers can truly be nil, in Swift *every* type
has a corresponding optional type.

You can put a value into an optional variable or constant just as you would a
normal one:

~~~swift
nonOptionalString = "Hello"
optionalString = "Halloj"
~~~

But, extracting the value is slightly different:

~~~swift
println(nonOptionalString)
println(optionalString)
~~~

The actual value is *wrapped* inside the optional. In order to use it, you need
to unwrap it. 

To further this discussion, let's work with a slightly more realistic example: A
function that takes a name as an optional string, and returns a greeting.

~~~swift
func greet(name: String?) -> String {
  return "What?"
}
greet("Joe")
~~~

There's more than one way to deal with this. First of all, there's a
highly-dangerous forced unwrapping operation that can be done with the `!`
character:

~~~swift
func greet2(name: String?) -> String {
  return "Hello, \(name!)"
}
greet2("Joe")
//greet2(nil)   // This crashes
~~~

If your optional has a value, that's great, but if not, using the `!` will
probably crash your app!

Another option is to use the new switch-case construct in Swift to deal with
each possibility separately. Don't worry about the details, we'll look at the
new switch-case stuff later:
~~~swift
func greet3(name: String?) -> String {
  switch (name) {
    case let .None:
      return "Hello, nobody"
    case let .Some(value):
      return "Hello, \(value)"
  }
}
greet3("Joe")
greet3(nil)
~~~

Another option is to use the special "if let" form of conditional assignment,
like this:
~~~swift
func greet4(name: String?) -> String {
  if let realString = name {
    return "Hello, \(realString)"
  } else {
    return "Hello, nobody"
  } 
}
greet4("Joe")
greet4(nil)
~~~
What that does is this: The program checks the optional value on the right
(`name`) to see if it contains a value. If it does, that value is
assigned to a new constant, which is then available inside the following
curly-braces block. Note that the constant is scoped to only that block, and
isn't available further down in the code.


Shortcuts around nil-checks
-----
One of the main problems with optionals that potentially contain nil values in
Swift is that if you try to call a method on a nil, your app will crash. This is
the opposite of Objective-C, but it's similar to many other languages. Probably
everyone has seen something like this in Java, C#, ruby, or elsewhere:

~~~
if person != nil && person.employer != nil && person.employer.office != nil {
  person.employer.office.deliver(parcel)
}
~~~
That's the kind of thing that we've always been able to ignore in Objective-C,
where if any property in this chain returns nil:
~~~
[person.employer.office deliver:parcel];
~~~
then the entire line of code will just not execute further. In Swift, Apple has
provided a shortcut that lets us avoid the earlier mess. Assuming that person is
optional, and it has an optional employer, and it has an optional office, we can
simply write this:

~~~
person?.employer?.office?.deliver(parcel)
~~~ 

Optionals Everywhere
-----

Optionals can be used just about everywhere in Swift. Any variable, constant,
property, parameter, or return value that can be a normal type can also be an
optional type. Basically, you can be sure that optionals are involved anywhere
you see a `?`, and also anywhere you see an `!`. Which brings us to our next
point.

Implicitly Unwrapped Optionals
-----
Sometimes, you'll need to have a property which is nil at the very beginning of
its life, but quickly gets a value and keeps that value forever. In such a case,
you'd rather not have to unwrap it all the time. Implicitly Unwrapped Optionals
let you do this. Declare them with `!` instead of `?`. A typical example is an
IBOutlet, since these normally aren't connected when init is called, but
shortly thereafter.
~~~swift
import UIKit
class ViewController: UIViewController {
    @IBOutlet var emailTF: UITextField!
}
~~~
With that in place, you can access emailTF as an optional, checking its value
with if-let or switch or map; Or, you can access it as an actual UITextField,
with the caveat that if you're wrong, and it's actually nil, you'll crash your
app. It's OK to use this feature for IBOutlets, but you should exercise great caution before using this features in any new ways.

