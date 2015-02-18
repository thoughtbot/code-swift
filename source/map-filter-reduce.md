# Map, Filter, and Reduce

### Map

The Swift standard library comes with a `map` implementation for the `Array` type. Using `map`, you can obtain
an new array by applying a function to every member of an existing one.

~~~swift
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

### Filter

When applied to arrays, `filter` allows you to create a new array by running every member of an existing array
through a function that returns a boolean value.

~~~swift
func isSquare(rect: CGRect) -> Bool {
  return rect.width == rect.height
}

let squareRects = rects.filter { isSquare($0) }
~~~

### Reduce

Just like its name implies, `reduce` allows you to reduce an array into a single value using a function that takes
two arguments: an accumulator and a member of the array.

~~~swift
func maxHeight(rect1: CGRect, rect2: CGRect) -> CGRect {
  return rect1.height >= rect2.height ? rect1 : rect2
}

let largestRect = rects.reduce(CGRect(), combine: maxHeight)
~~~
