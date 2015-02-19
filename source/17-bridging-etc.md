The Bridging Header
-----

Use this to expose Objective-C and C headers to your Swift code.
When you add your first swift file to an existing Objective-C project, Xcode 
prompts for creation of bridging header. Say yes!
Here's an example.

~~~
//
//  Use this file to import your
//  target's public headers that you
//  would like to expose to Swift.
//

#import "PluginProtocol.h"
~~~

Pretty simple. Only downside is loss of granularity.



Bridged Types
-----
Some Objective-C types are automatically bridged to swift equivalents.
From Swift’s point of view, all Foundation Kit collection types are 
bridged to contain values typed to AnyObject, so you may need to 
cast things later.

~~~
NSString                 String
NSArray                  Array
NSDictionary             Dictionary
NSSet                    Set
NSNumber                 Int, Float
NSInteger, NSUInteger    Int
~~~

Shortcut for respondsToSelector:
-----
Swift has a nice shortcut for respondsToSelector:

~~~
// Objective-C:
if ([delegate respondsToSelector:@selector(foo)]) {
    [delegate foo];
}
~~~
~~~swift
// Swift:
delegate?.foo?()
~~~
The first ? is in case the optional delegate is nil, the second is checking to 
see if the method exists.
Technically, this only works when checking for “optional” methods 
declared in a protocol that the receiver conforms to. For the more 
general case of asking any object about any method, you’ll still have 
to use `respondsToSelector:`

