/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## Smart key paths

 Probably one of the headline features of Swift 4 is the new key paths model described in [SE-0161][SE-0161]. Unlike the string-based key paths in Cocoa, Swift key paths are strongly typed.

 [SE-0161]: https://github.com/apple/swift-evolution/blob/master/proposals/0161-key-paths.md "Swift Evolution Proposal SE-0161: Smart KeyPaths: Better Key-Value Coding for Swift"
 */
struct Person {
    var name: String
}

struct Book {
    var title: String
    var authors: [Person]
    var primaryAuthor: Person {
        return authors.first!
    }
}

let abelson = Person(name: "Harold Abelson")
let sussman = Person(name: "Gerald Jay Sussman")
let sicp = Book(title: "Structure and Interpretation of Computer Programs", authors: [abelson, sussman])

/*:
 Key paths are formed by starting at a root type and drilling down any combination of property and subscript names.
 
 You write a key path by starting with a backslash: `\Book.title`. Every type automatically gets a `[keyPath: …]` subscript to get or set the value at the specified key path.
 */
sicp[keyPath: \Book.title]
// Key paths can to drill down and work for computed properties
sicp[keyPath: \Book.primaryAuthor.name]

/*:
 Key paths are objects that can be stored and manipulated. For example, you can append additional segments to a key path to drill down further.
 */
let authorKeyPath = \Book.primaryAuthor
type(of: authorKeyPath)
let nameKeyPath = authorKeyPath.appending(path: \.name) // you can omit the type name if the compiler can infer it
sicp[keyPath: nameKeyPath]

/*:
 ### Key paths for subscripts
 
 Key paths will also work with subscripts. This makes them very convenient to drill down into collections such as arrays or dictionaries. This functionality wasnʼt yet implemented in the snapshot I tested.
 */
//sicp[keyPath: \Book.authors[0].name]
// INTERNAL ERROR: feature not implemented: non-property key path component

/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
