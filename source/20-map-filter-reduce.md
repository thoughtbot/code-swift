# Map, Filter, and Reduce

### Arrays

The Swift standard library comes with a `map` implementation for the `Array` type. Using `map`, you can apply a function to every member of an array to get a new array containing values that conform to the return type of the applied function.

~~~swift
import CoreGraphics

let rect1 = CGRect(x: 0, y: 0, width: 100, height: 100)
let rect2 = CGRect(x: 40, y: 40, width: 80, height: 200)
let rect3 = CGRect(x: 12, y: 70, width: 50, height: 420)

let rects: [CGRect] = [rect1, rect2, rect3]

func halfSizeRect(rect: CGRect) -> CGRect {
  let transform = CGAffineTransformMakeScale(0.5, 0.5)
  return CGRectApplyAffineTransform(rect, transform)
}

let resizedRects = rects.map { halfSizeRect($0) }
~~~

When applied to arrays, `filter` allows you to create a new array by running every member of an existing array
through a function that returns a boolean value.

~~~swift
func isSquare(rect: CGRect) -> Bool {
  return rect.width == rect.height
}

let squareRects = rects.filter { isSquare($0) }
~~~

Just like its name implies, `reduce` allows you to reduce an array into a new value using a function that takes
two arguments: an accumulator and a member of the array.

~~~swift
let union = resizedRects.reduce(CGRect(), combine: CGRectUnion)
~~~

### Optionals

Swift also comes with an implementation of `map` for optionals.


