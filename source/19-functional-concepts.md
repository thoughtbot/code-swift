# Functional Programming in Swift: A Primer

Swift is a multi-paradigm language, with strong influence from object-oriented and functional practices.

### First-class functions

In Swift, functions can be treated as *values* and are thus referred to as *first-class functions*.

### Higher Order functions

Higher order functions are functions that can operate on functions: they either take other functions as arguments or return them as results.

#### Returning Functions

~~~swift
typealias Prefixer = String -> String

func prefixerFactory(prefix: String) -> Prefixer {
// func prefixFactory(prefix: String) -> (String -> String)

  func aPrefixer(word: String) -> String {
    return prefix + word
  }

  return aPrefixer
}

let repeat = prefixerFactory("re-")
repeat("do")
~~~

*Note*: You can also return an anonymous function.

~~~swift
func otherPrefixerfactory(prefix: String) -> Prefixer {
  return { word in
    return prefix + word
  }
}
~~~

#### Taking Functions as Arguments

~~~swift
func uppercasePrefixer(word: String, prefixer: Prefixer) -> String {
  return prefixer(word).uppercaseString
}

uppercasePrefixer("do", repeat)
~~~

### Functional Purity

Functions should have no side effects. They do not alter the state around them:

#### Immutability

Functions operate on copies of existing values instead of mutating them.

~~~swift
struct Employee {
  let name: String
  var age: Int

  func incrementAge() -> Employee {
    return Employee(name: self.name, age: self.age + 1)
  }
}

struct OtherEmployee {
  let name: String
  var age: Int

  mutating func incrementAge() {
    age += 1
  }
}
~~~

#### Referential transparency

Functions return the same value each time they are invoked with the same arguments.

~~~swift
import CoreGraphics

func randomMultiplier(count: Int) -> Int {
  return count * random()
}

randomMultiplier(1)
randomMultiplier(1)
~~~

### Function Composition

Functions can be composed to create more complex functions.

~~~swift
let someRect = CGRect(origin: CGPointZero, size: CGSize(width: 100, height: 100))

func halfSizeRect(rect: CGRect) -> CGRect {
  let transform = CGAffineTransformMakeScale(0.5, 0.5)
  return CGRectApplyAffineTransform(rect, transform)
}

func rotateRect(rect: CGRect) -> CGRect {
  let transform = CGAffineTransformMakeRotation(1)
  return CGRectApplyAffineTransform(rect, transform)
}

func rotateHalfSizeRect(rect: CGRect) -> CGRect {
  return rotateRect(halfSizeRect(rect))
}

let transformedRect = rotateHalfSizeRect(someRect)
~~~

#### Custom Operators

You can define your own function composition operator and use it to make things more seamless:

~~~swift
typealias Transformer = CGRect -> CGRect
infix operator >>> { associativity left }

func >>> (transformer1: Transformer , transformer2: Transformer) -> Transformer {
  return { rect in
    transformer2(transformer1(rect))
  }
}

let halfSizeRectWithRotation = halfSizeRect >>> rotateRect
let otherTransformedRect = halfSizeRectWithRotation(someRect)
~~~

### Currying

A technique that involves decomposing a function that take multiple arguments to a series of functions that each take one argument.

~~~swift
func makeRect(x: Int, y: Int, width: Int, height: Int) -> CGRect {
  return CGRect(x: x, y: y, width: width, height: height)
}

func curriedMakeRect(# x: Int)(y: Int)(width: Int)(height: Int) -> CGRect {
  return CGRect(x: x, y: y, width: width, height: height)
}

curriedMakeRect(x: 0) // ------------------------------ function(y: Int)(width: Int)(height: Int) -> CGRect
curriedMakeRect(x: 0)(y: 0) // ------------------------ function(width: Int)(height: Int) -> CGRect
curriedMakeRect(x: 0)(y: 0)(width: 100) // ------------ function(height: Int) -> CGRect
curriedMakeRect(x: 0)(y: 0)(width: 100)(height: 100) // CGRect
~~~
