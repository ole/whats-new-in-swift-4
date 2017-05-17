/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## Generic subscripts

 [SE-0148][SE-0148]: Subscripts can now have generic arguments and/or return types. The canonical example is a type that represents JSON data: you can define a generic subscript to have the callerʼs context define the expected return type.

 [SE-0148]: https://github.com/apple/swift-evolution/blob/master/proposals/0148-generic-subscripts.md "Swift Evolution Proposal SE-0148: Generic Subscripts"
 */

struct JSON {
    fileprivate var storage: [String:Any]

    init(dictionary: [String:Any]) {
        self.storage = dictionary
    }

    subscript<T>(key: String) -> T? {
        return storage[key] as? T
    }
}

let json = JSON(dictionary: [
    "name": "Berlin",
    "country": "de",
    "population": 3_500_500
    ])
// No need to use as? Int
let population: Int? = json["population"]
/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
