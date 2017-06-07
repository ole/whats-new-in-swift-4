/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## Associated type constraints

 [SE-0142][SE-0142]: associated types in protocols can now be constrained with `where` clauses. This seemingly small change makes the type system much more expressive and facilitates a significant simplification of the standard library. In particular, working with `Sequence` and `Collection` is a lot more intuitive in Swift 4.

 [SE-0142]: https://github.com/apple/swift-evolution/blob/master/proposals/0142-associated-types-constraints.md "Swift Evolution Proposal SE-0142: Permit where clauses to constrain associated types"

 ### `Sequence.Element`

 `Sequence` now has its own `Element` associated type. Anywhere you had to write `Iterator.Element` in Swift 3, you can now just write `Element`:
 */
extension Sequence where Element: Numeric {
    var sum: Element {
        var result: Element = 0
        for element in self {
            result += element
        }
        return result
    }
}

[1,2,3,4].sum

/*:
 ### Fewer constraints neeeded when extending `Sequence` and `Collection`
 */
// In Swift 3, this extension required more constraints:
//extension Sequence where Iterator.Element: Equatable,
//    SubSequence: Sequence,
//    SubSequence.Iterator.Element == Iterator.Element
//
// In Swift 4, two of the threee constraints are already known to the compiler because they can be expressed in the type system using where clauses for associated types.
extension Sequence where Element: Equatable {
    func headMirrorsTail(_ n: Int) -> Bool {
        let head = prefix(n)
        let tail = suffix(n).reversed()
        return head.elementsEqual(tail)
    }
}

[1,2,3,4,2,1].headMirrorsTail(2)

/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
