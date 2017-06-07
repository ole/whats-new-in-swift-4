/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## `Dictionary` and `Set` enhancements

 [SE-0165][SE-0165] adds several nice enhancements to `Dictionary` and `Set`.

 [SE-0165]: https://github.com/apple/swift-evolution/blob/master/proposals/0165-dict.md "Swift Evolution Proposal SE-0165: Dictionary and Set Enhancements"
 
 ### Sequence-based initializer
 
 Create a dictionary from a sequence of key-value pairs.
 */
let names = ["Cagney", "Lacey", "Bensen"]
let dict = Dictionary(uniqueKeysWithValues: zip(1..., names))
dict[2]

/*:
 ### Merging initializer and `merge` method
 
 Specify how duplicate keys should be handled when creating a dictionary from a sequence or merging a sequence into an existing dictionary.
 */
let duplicates = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
let letters = Dictionary(duplicates, uniquingKeysWith: { (first, _) in first })
letters

/*:
 Using the merging initializer or the `merge` method is not as pleasant as it should be when the sequence youʼre merging in is another dictionary. Since the element type of a dictionary is a _labeled_ tuple of the form `(key: Key, value: Value)` and the new methods expect a sequence with an _unlabeled_ tuple element type `(Key, Value)`, you have to perform a manual conversion. I hope this gets fixed in a future build. See [SR-922](https://bugs.swift.org/browse/SR-922) and [SR-4969](https://bugs.swift.org/browse/SR-4969).
 */
let defaults = ["foo": false, "bar": false, "baz": false]
var options = ["foo": true, "bar": false]
// This produces an annoying type checker error: error: generic parameter 'S' could not be inferred
//let mergedOptions = options.merge(defaults) { (old, _) in old }
// You have to do this instead:
options.merge(defaults.map { $0 }) { (old, _) in old }
options

/*:
 ### Subscript with default value
 
 You can provide a default value that will be returned for missing keys as a subscript argument, making the return type non-optional.
 */
dict[4, default: "(unknown)"]

/*:
 This is especially useful when you want to mutate a value through the subscript:
 */
let source = "how now brown cow"
var frequencies: [Character: Int] = [:]
for c in source {
    frequencies[c, default: 0] += 1
}
frequencies

/*:
 ### Dictionary-specific `map` and `filter`
 
 `filter` returns a `Dictionary` and not an `Array`. Similarly, the new `mapValues` method transforms the values while preserving the dictionary structure.
 */
let filtered = dict.filter {
    $0.key % 2 == 0
}
type(of: filtered)

let mapped = dict.mapValues { value in
    value.uppercased()
}
mapped

/*:
 `Set.filter` also returns a `Set` now and not an `Array`.
 */
let set: Set = [1,2,3,4,5]
let filteredSet = set.filter { $0 % 2 == 0 }
type(of: filteredSet)

/*:
 ### Grouping a sequence
 
 Group a sequence of values into buckets, e.g. partition words in a word list by their initial letter. This is one of my favorites.
 */
let contacts = ["Julia", "Susan", "John", "Alice", "Alex"]
let grouped = Dictionary(grouping: contacts, by: { $0.first! })
grouped

/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
