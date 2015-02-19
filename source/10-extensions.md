Extensions
-----
In Objective-C we have categories that let you add methods and 
properties to any class, including ones you don't have the source 
for. In Swift, that same feature is called an Extension. Unlike Objective-C 
categories, Swift extensions don't each have a name of their own.

~~~swift
extension String {
    var toUpper: String {
        return self.uppercaseString
    }
}

"hello".toUpper
~~~

