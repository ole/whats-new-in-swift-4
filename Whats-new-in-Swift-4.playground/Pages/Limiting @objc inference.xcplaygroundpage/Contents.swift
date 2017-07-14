/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## Limiting `@objc` inference

 In many places where Swift 3 automatically inferred a declaration to be `@objc` (and thus visible from Objective-C), Swift 4 doesn’t do this anymore ([SE-0160][SE-0160]). Most importantly, `NSObject` subclasses no longer infer `@objc` for their members.

 [SE-0160]: https://github.com/apple/swift-evolution/blob/master/proposals/0160-objc-inference.md "Swift Evolution Proposal SE-0160: Limiting @objc inference"
 */
import Foundation

class MyClass : NSObject {
    func foo() { }       // not exposed to Objective-C in Swift 4
    @objc func bar() { } // explicitly exposed to Objective-C
}

/*:
 ### `@objcMembers` shorthand

 If want to expose all or most members of a class to Objective-C, you can use the `@objcMembers` attribute on the class declaration to save you some typing:
 */
@objcMembers
class MyClass2 : NSObject {
    func foo() { }             // implicitly @objc
    func bar() -> (Int, Int) { // not @objc, because tuples aren't representable in Objective-C (unchanged from Swift 3)
        return (0, 0)
    }
}

/*:
 Use `@nonobjc` on an extension to disable `@objc` inference (through `@objcMembers`) for all declarations in the extension.
 */
@nonobjc extension MyClass2 {
    func wobble() { } // not @objc, despite @objcMembers
}

/*:
 ### `dynamic` doesn’t imply `@objc`

 Also note that `dynamic` doesn’t imply `@objc` anymore. If you want to use features that depend on the dynamic dispatch of the Objective-C runtime (such as KVO), you may need to add `@objc dynamic` to a declaration. See the [Key paths page](Key%20paths) for a KVO example.

 Since `dynamic` is currently implemented in terms of the Objective-C runtime, this means all current usages of `dynamic` also have to be `@objc`. While this sounds redundant at the moment, it’s an important step on the way to eventually make `dynamic` a pure Swift feature in a future version of the language.
 */
/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 */

