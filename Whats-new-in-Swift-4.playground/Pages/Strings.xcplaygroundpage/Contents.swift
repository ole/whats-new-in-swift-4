/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 
 ## Strings

 ### Multi-line string literals

 [SE-0168][SE-0168] introduces a simple syntax for multi-line string literals using three double-quotes (`"""`). Inside a multi-line string literal, you don’t need to escape a single double-quote, which means that most text formats (such as JSON or HTML) can be pasted in without any escaping. The indentation of the closing delimiter determines how much whitespace is stripped from the start of each line.
 
 [SE-0168]: https://github.com/apple/swift-evolution/blob/master/proposals/0168-multi-line-string-literals.md "Swift Evolution Proposal SE-0168: Multi-Line String Literals"
 */
let multilineString = """
    This is a multi-line string.
    You don't have to escape "quotes" in here.
    The position of the closing delimiter
      controls whitespace stripping.
    """
print(multilineString)

/*:
 Activate Xcode’s Console (_View > Debug Area > Activate Console_) to see the `print` output.

 ### String is a `Collection` again

 [SE-0163][SE-0163] is the first part of the revised string model for Swift 4. The biggest change is that `String` is a `Collection` again (as it used to be in Swift 1.x), i.e. the functionality of `String.CharacterView` has been folded into the parent type. (The other views, `UnicodeScalarView`, `UTF8View`, and `UTF16View`, still exist.)
 
 Note that SE-0163 isn’t fully implemented yet and there are a few more string-related proposals in the pipeline, such as an internal redesign of the `String.Index` type ([SE-0180][SE-0180]).

 [SE-0163]: https://github.com/apple/swift-evolution/blob/master/proposals/0163-string-revision-1.md "Swift Evolution Proposal SE-0163: String Revision: Collection Conformance, C Interop, Transcoding"
 [SE-0180]: https://github.com/apple/swift-evolution/blob/master/proposals/0180-string-index-overhaul.md "Swift Evolution Proposal SE-0180: String Index Overhaul"
 */
let greeting = "Hello, 😜!"
// No need to drill down to .characters
greeting.count
for char in greeting {
    print(char)
}

/*:
 ### `Substring` is the new type for string slices

 String slices are now instances of type `Substring`. Both `String` and `Substring` conform to `StringProtocol`. Almost the entire string API will live in `StringProtocol` so that `String` and `Substring` behave largely the same.
 */
let comma = greeting.index(of: ",")!
let substring = greeting[..<comma]
type(of: substring)
// Most String APIs can be called on Substring
print(substring.uppercased())

/*:
 A `Substring` keeps the full `String` value it was created from alive. This can lead to accidental high memory usage when you pass a seemingly small `Substring` that holds on to a large `String` to other API. For this reason, most functions that take a string as an argument should continue to accept only `String` instances; you generally should not make such functions generic to accept any value conforming to `StringProtocol`.

 To convert a `Substring` back to a `String`, use a `String()` initializer. This will copy the substring into a new buffer:
 */
let newString = String(substring)
type(of: newString)

/*:
 ### Unicode 9
 
 Swift 4 supports Unicode 9, fixing [some problems with proper grapheme clustering for modern emoji][Emoji 4.0]. All the character counts below are now correct (they weren’t in Swift 3):

 [Emoji 4.0]: https://oleb.net/blog/2016/12/emoji-4-0/
 */
"👧🏽".count // person + skin tone; in Swift 3: 2
"👨‍👩‍👧‍👦".count // family with four members; in Swift 3: 4
"👱🏾\u{200D}👩🏽\u{200D}👧🏿\u{200D}👦🏻".count // family + skin tones; in Swift 3: 8
"👩🏻‍🚒".count // person + skin tone + profession; in Swift 3: 3
"🇨🇺🇬🇫🇱🇨".count // multiple flags; in Swift 3: 1

/*:
 ### `Character.unicodeScalars` property
 
 You can now access the code points of a `Character` directly without having to convert it to a `String` first ([SE-0178][SE-0178]):

 [SE-0178]: https://github.com/apple/swift-evolution/blob/master/proposals/0178-character-unicode-view.md "Swift Evolution Proposal SE-0178: Add `unicodeScalars` property to `Character`"
 */
let c: Character = "🇪🇺"
Array(c.unicodeScalars)

/*:
 ### Converting between `Range<String.Index>` and `NSRange`

 Foundation comes with new initializers on `NSRange` and `Range<String.Index>` to convert between the two, removing the need to manually compute UTF-16 offsets. This makes it easier to use APIs that still work on `NSRange`s, such as `NSRegularExpression` and `NSAttributedString`.
 */
// Given a String range
let string = "Hello 👩🏽‍🌾👨🏼‍🚒💃🏾"
let index = string.index(of: Character("👩🏽‍🌾"))!
let range = index...

// Convert the String range to an NSRange
import Foundation

let nsRange = NSRange(range, in: string)
nsRange.length // length in UTF-16 code units
string[range].count // length in Characters
assert(nsRange.length == string[range].utf16.count)

// Use the NSRange to format an attributed string
import AppKit

let formatted = NSMutableAttributedString(string: string, attributes: [.font: NSFont.systemFont(ofSize: 14)])
formatted.addAttribute(.font, value: NSFont.systemFont(ofSize: 48), range: nsRange)

// NSAttributedString APIs return NSRange
let lastCharacterIndex = string.index(before: string.endIndex)
let lastCharacterNSRange = NSRange(lastCharacterIndex..., in: string)
var attributesNSRange = NSRange()
_ = formatted.attributes(at: lastCharacterNSRange.location, longestEffectiveRange: &attributesNSRange, in: nsRange)
attributesNSRange

// Convert the NSRange back to Range<String.Index> to use it with String
let attributesRange = Range(attributesNSRange, in: string)!
string[attributesRange]

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 */
