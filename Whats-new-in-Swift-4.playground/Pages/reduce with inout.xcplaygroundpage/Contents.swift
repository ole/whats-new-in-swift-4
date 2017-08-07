/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## `reduce` with `inout`

 [SE-0171][SE-0171] adds a variant of `reduce` in which the partial result is passed `inout` to the combine function. This can be a significant performance boost for algorithms that use `reduce` to incrementally build a sequence by eliminating copies of the intermediate results.

 [SE-0171]: https://github.com/apple/swift-evolution/blob/master/proposals/0171-reduce-with-inout.md "Swift Evolution Proposal SE-0171: Reduce with `inout`"
 */
extension Sequence where Element: Equatable {
    func removingConsecutiveDuplicates() -> [Element] {
        return reduce(into: []) { (result: inout [Element], element) in
            if result.last != element {
                result.append(element)
            }
        }
    }
}

[1,1,1,2,3,3,4].removingConsecutiveDuplicates()

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 */
