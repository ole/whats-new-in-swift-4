/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## Archival and serialization

 [SE-0166: Swift Archival & Serialization][SE-0166] defines a way to archive and serialize any Swift value (classes, structs, and enums). Types can make themselves (un-)archivable by conforming to the `Codable` protocol.
 
 In many cases this is all you have to do because the compiler can generate a default implementation if all members of your types are themselves `Codable`. If you need to customize how your type encodes itself, you can also override the default behavior. There is a lot to this topic — be sure to read the proposal for details.
 
 [SE-0166]: https://github.com/apple/swift-evolution/blob/master/proposals/0166-swift-archival-serialization.md "Swift Evolution Proposal SE-0166: Swift Archival & Serialization"

 */
// Make a custom type archivable by conforming it (and all its members) to Codable
struct Card: Codable {
    enum Suit: String, Codable {
        case clubs, spades, hearts, diamonds
    }

    enum Rank: Int, Codable {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }

    var suit: Suit
    var rank: Rank
}

let hand = [Card(suit: .clubs, rank: .ace), Card(suit: .hearts, rank: .queen)]

/*:
 ### Encoding
 
 Once you have a `Codable` value, you need to pass it to an encoder in order to serialize it.
 
 Youʼll be able to write your own encoders and decoders that make use of the `Codable` infrastructure, but Swift will come with a built-in set of encoders and decoders for JSON (`JSONEncoder` and `JSONDecoder`) and property lists (`PropertyListEncoder` and `PropertyListDecoder`). These are defined in [SE-0167][SE-0167]. `NSKeyedArchiver` will also support all `Codable` types.
 
 SE-0167 is not fully implemented yet, so itʼs no surprise that the encoders crash in the toolchain I tested.

 [SE-0167]: https://github.com/apple/swift-evolution/blob/master/proposals/0167-swift-encoders.md "Swift Evolution Proposal SE-0167: Swift Encoders"
 */
import Foundation

var encoder = JSONEncoder()
// This causes a crash (EXC_BAD_INSTRUCTION) in the toolchain I tested.
//let jsonData = try encoder.encode(hand)
//String(data: jsonData, encoding: .utf8)

/*:
 ### Decoding
 */
let decoder = JSONDecoder()
// This causes a crash (EXC_BAD_INSTRUCTION) in the toolchain I tested.
//let decoded = try decoder.decode([Card].self, from: jsonData)

/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
