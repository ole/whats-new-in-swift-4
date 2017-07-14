/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## Private declarations visible in same-file extensions

 [SE-0169][SE-0169] changes the access control rules such that `private` declarations are also visible inside extensions of the parent type _in the same file_. This makes it possible to split your type definition into multiple extensions and still use `private` for most "private" members, reducing the need for the unloved `fileprivate` keyword.

 [SE-0169]: https://github.com/apple/swift-evolution/blob/master/proposals/0169-improve-interaction-between-private-declarations-and-extensions.md "Swift Evolution Proposal SE-0169: Improve Interaction Between private Declarations and Extensions"
 */
struct SortedArray<Element: Comparable> {
    private var storage: [Element] = []
    init(unsorted: [Element]) {
        storage = unsorted.sorted()
    }
}

extension SortedArray {
    mutating func insert(_ element: Element) {
        // storage is visible here
        storage.append(element)
        storage.sort()
    }
}

let array = SortedArray(unsorted: [3,1,2])

// storage is _not_ visible here. It would be if it were fileprivate.
//array.storage // error: 'storage' is inaccessible due to 'private' protection level

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 */
