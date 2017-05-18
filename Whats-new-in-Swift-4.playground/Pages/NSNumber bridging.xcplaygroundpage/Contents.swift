/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## `NSNumber` bridging

 [SE-0170][SE-0170] fixes some dangerous behavior when bridging between native Swift number types and `NSNumber`.
 
 [SE-0170]: https://github.com/apple/swift-evolution/blob/master/proposals/0170-nsnumber_bridge.md "Swift Evolution Proposal SE-0170: NSNumber bridging and Numeric types"
 */
import Foundation

let n = NSNumber(value: UInt32(543))
let v = n as? Int8 // nil in Swift 4. This would be 31 in Swift 3 (try it!).

/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
