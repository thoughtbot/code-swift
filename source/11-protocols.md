Protocols
-----

Swift’s Protocols are just like in Objective-C. They are simple lists 
of methods and properties, which must be implemented in anything 
that wants to conform to that protocol. Also just like Objective-C, 
Protocols can inherit from other protocols.
~~~swift
protocol FullyNamed {
    var fullName: String { get }
}
// Compiler will complain here because `Person` doesn't implement this protocol
class Person: FullyNamed {
}
~~~
The single largest difference about protocols in Objective-C and in Swift is
that Swift uses many, many more protocols internally than Objective-C ever has. 
