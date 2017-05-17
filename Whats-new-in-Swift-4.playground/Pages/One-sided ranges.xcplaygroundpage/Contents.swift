/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 
 ## One-sided ranges

 [SE-0172][SE-0172] introduces a new `RangeExpression` protocol and a set of prefix/postfix operators to form one-sided ranges, i.e. ranges where either the lower or upper bound is unspecified.

 [SE-0172]: https://github.com/apple/swift-evolution/blob/master/proposals/0172-one-sided-ranges.md "Swift Evolution Proposal SE-0172: One-sided Ranges"
 
 ### Infinite Sequences
 
 You can use a one-sided range to construct an infinite sequence, e.g. as a more flexible replacement for `enumerated()` when you donʼt want the numbering to start at zero:
 */
let letters = ["a","b","c","d"]
let numberedLetters = zip(1..., letters)
Array(numberedLetters)
/*:
 ### Collection subscripts
 
 When used in a collection subscript, the collectionʼs `startIndex` or `endIndex` “fills in” the missing lower or upper bound, respectively.
 */
let numbers = [1,2,3,4,5,6,7,8,9,10]
// Instead of numbers[5..<numbers.endIndex]
numbers[5...]

/*:
 ### Pattern Matching
 
 One-sided ranges can be used in pattern matching constructs, e.g. in a `case` expression in a `switch` statement. Notice that the compiler canʼt (yet?) determine that the `switch` is exhaustive, though.
 */
let value = 5
switch value {
case 1...:
    print("greater than zero")
case 0:
    print("zero")
case ..<0:
    print("less than zero")
default:
    fatalError("unreachable")
}
/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
