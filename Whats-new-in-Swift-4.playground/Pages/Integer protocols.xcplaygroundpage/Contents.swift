/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## New integer protocols

 [SE-0104][SE-0104] was originally accepted for Swift 3, but didnʼt make the cut. Now a slightly revised version is coming in Swift 4. “This proposal cleans up Swifts integer APIs and makes them more useful for generic programming.”

 [SE-0104]: https://github.com/apple/swift-evolution/blob/master/proposals/0104-improved-integers.md "Swift Evolution Proposal SE-0104: Protocol-oriented integers"

 The protocol hierarchy looks like this:

 ![](integer-protocols.png)

 This might look a little intimidating, but the most important thing to take away from this is that you don’t have to care about all the protocols. Just use the integer types you’re familiar with, such as `Int` and `UInt8`, as you always have and you’ll be absolutely fine. The new protocols only come into play once you want to write generic algorithms that work on multiple numeric types.

 For a library that takes advantage of the new protocols, check out [NumericAnnex](https://github.com/xwu/NumericAnnex) by Xiaodi Wu.

 ### Heterogeneous comparison operators

 You can now compare an `Int` to an `UInt` without explicit conversion, thanks to new generic overloads for these functions in the standard library.
 */
let a: Int = 5
let b: UInt = 5
let c: Int8 = -10
a == b // doesn't compile in Swift 3
a > c  // doesn't compile in Swift 3

/*:
 Note that mixed-type _arithmetic_ doesn’t work because Swift doesn’t have a concept of _promoting_ one type to another yet. (The implicit promotion of `T` to `Optional<T>` is an exception, hardcoded into the compiler.) This is a desirable feature for a future version.
 */
//a + b // doesn't compile in either Swift 3 or 4

/*:
 There’s a lot more to the new protocols. Here are a few examples of new properties and methods:
 */
// Get information about the bit pattern
0xFFFF.words
0b11001000.trailingZeroBitCount
(0b00001100 as UInt8).leadingZeroBitCount
0b110001.nonzeroBitCount

// Artihmetic with overflow reporting
let (partialValue, overflow) = Int32.max.addingReportingOverflow(1)
partialValue
overflow

// Calculate the full result of a multiplication that would otherwise overflow
let x: UInt8 = 100
let y: UInt8 = 20
let result = x.multipliedFullWidth(by: y)
result.high
result.low

/*:
 I left out some more additions, such as new bit shifting operators and semantics. Read the proposal to get the full picture.
 */
/*:
 ### `DoubleWidth`

 The new `DoubleWidth<T>` type is supposed to make it possible to create wider fixed-width integer types from the ones available in the standard library. It didn't work in my tests yet, however.
 */
//var veryBigNumber = DoubleWidth<Int64>(Int64.max) // EXC_BAD_INSTRUCTION
//veryBigNumber + 1

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 */

