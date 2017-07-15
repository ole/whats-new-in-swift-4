/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## `NSNumber` bridging

 [SE-0170][SE-0170] fixes some dangerous behavior when bridging between native Swift number types and `NSNumber`.
 
 [SE-0170]: https://github.com/apple/swift-evolution/blob/master/proposals/0170-nsnumber_bridge.md "Swift Evolution Proposal SE-0170: NSNumber bridging and Numeric types"
 */
import Foundation

let n = NSNumber(value: UInt32(543))
let v = n as? Int8 // nil in Swift 4. This would be 31 in Swift 3 (try it!).

/*:
 ### Floating-point `NSNumber` bridging

 Initially, in Xcode 9 beta 1, the same rules applied to floating-point bridging, which meant for example that `NSNumber(value: 0.1) as? Float` would return `nil` because the double-precision representation of `0.1` is not exactly representable as a single-precision float. [This change was reverted to the Swift 3 behavior](https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20170612/037499.html).
 */
NSNumber(value: 0.1) as? Double
NSNumber(value: 0.1) as? Float // Returned nil in Xcode 9 beta 1, now changed back to Swift 3 behavior

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 */
