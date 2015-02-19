Enumerations
-----

Enumerations are similar to their C equivalent. You can use one to 
select from one of several options.

~~~swift
enum ButtonType {
    case Square
    case RoundedCorners
    case Circle
}

let type = ButtonType.Square
~~~

Also, each of those can have one or several associated values. The 
choice you make in an enum can contain a piece of data.

~~~swift
enum DateComponent {
    case Year(Int)
    case Month(Int)
    case Day(Int)
    case TimeOfDay(Int, Int)
}

let thisYear = DateComponent.Year(2015)
let thisMonth = DateComponent.Month(2)
let todaysDate = DateComponent.Day(19)
let startTime = DateComponent.TimeOfDay(12, 20)
~~~
Enumerations can also have methods, protocols, and extensions, 
just like classes and structs.

Like structs, enums have no inheritance structure, and are always pass-by-value.

The NS_ENUM macro
-----
Existing types declared using NS_ENUM automatically get nice Swift 
translations. Something declared like this in Objective-C:

~~~
typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
   UITableViewCellStyleDefault,
   UITableViewCellStyleValue1,
   UITableViewCellStyleValue2,
   UITableViewCellStyleSubtitle
};
~~~

Becomes this in Swift:
~~~swift
enum UITableViewCellStyle: Int {
    case Default
    case Value1
    case Value2
    case Subtitle
}
var style: UITableViewCellStyle = .Default
~~~

