/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## Associated type constraints

 [SE-0142][SE-0142]: associated types in protocols can now be constrained with `where` clauses. This seemingly small change makes the type system much more expressive and facilitates a significant simplification of the standard library. In particular, working with `Sequence` and `Collection` is a lot more intuitive in Swift 4.

 [SE-0142]: https://github.com/apple/swift-evolution/blob/master/proposals/0142-associated-types-constraints.md "Swift Evolution Proposal SE-0142: Permit where clauses to constrain associated types"

 ### `Sequence.Element`

 `Sequence` now has its own `Element` associated type. This is made possible by the new generics feature because `associatedtype Element where Element == Iterator.Element` can now be expressed in the type system.

 Anywhere you had to write `Iterator.Element` in Swift 3, you can now just write `Element`:
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
 Another example: In Swift 3, this extension required more constraints because the type system could not express the idea that the elements of `Collection`’s associated `Indices` type had the same type as `Collection.Index`:

     // Required in Swift 3
     extension MutableCollection where Index == Indices.Iterator.Element {
 */
extension MutableCollection {
    /// Maps over the elements in the collection in place, replacing the existing
    /// elements with their transformed values.
    mutating func mapInPlace(_ transform: (Element) throws -> Element) rethrows {
        for index in indices {
            self[index] = try transform(self[index])
        }
    }
}

/*:
 ## More generics features
 
 Two more important generics improvements have been accepted for Swift 4, but aren’t implemented yet:

 * [SE-0143 Conditional protocol conformances][SE-0143]
 * [SE-0157 Recursive protocol constraints][SE-0157]

 It looks like recursive constraints will still make it into Swift 4, whereas conditional conformance won’t make the cut.

 [SE-0143]: https://github.com/apple/swift-evolution/blob/master/proposals/0143-conditional-conformances.md
 [SE-0157]: https://github.com/apple/swift-evolution/blob/master/proposals/0157-recursive-protocol-constraints.md
 */

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 */
