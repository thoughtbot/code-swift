Switch
-----
The switch construct isn't much loved in C and Objective-C. Part of the reason
may be that it's so limited. In Swift, there's a lot more to it. Each case can match multiple items. No falling through from one case to next (no need to “break”). And you're not limited to integers!

~~~swift
func letterType(character: Character) -> String {
switch character {
  case "a", "e", "i", "o", "u":
      return "\(character) is a vowel"
  case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
      return "\(character) is a consonant"
  default:
      return "\(character) is not a vowel or a consonant"
  }
}
letterType("e")
letterType("x")
letterType("@")
~~~

Each case can also contain a range.
~~~swift
func amountDescription(countedThings: String, count: Int) -> String {
  let naturalCount: String
  switch count {
  case 0:
      naturalCount = "no"
  case 1...3:
      naturalCount = "a few"
  case 4...9:
      naturalCount = "several"
  default:
      naturalCount = "far too many"
  }
  return "There are \(naturalCount) \(countedThings)."
}
amountDescription("raindrops on the ground", 100)
amountDescription("Star Wars Movies", 8)
amountDescription("Apple Watches in this office", 0)
~~~

Each case can also match against a tuple. Use an underscore to mean "match
anything in this position".

~~~swift
func pointDescription(somePoint: (Int, Int)) -> String {
switch somePoint {
  case (0, 0):
      return "(0, 0) is at the origin"
  case (_, 0):
      return "(\(somePoint.0), 0) is on the x-axis"
  case (0, _):
      return "0, \(somePoint.1)) is on the y-axis"
  default:
      return "(\(somePoint.0), \(somePoint.1)) is on no axis"
  }
}
pointDescription((0, 0))
pointDescription((1, 0))
pointDescription((0, 1))
pointDescription((5, 5))
~~~

