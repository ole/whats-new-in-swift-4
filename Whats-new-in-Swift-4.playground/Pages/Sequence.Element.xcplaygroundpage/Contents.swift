/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## `Sequence.Element`

 `Sequence` (and `Collection`) now has its own `Element` associated type. Anywhere you had to write `Iterator.Element` in Swift 3, you can now just write `Element`:
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

/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
