/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 
 ## Strings

 ### Multi-line string literals

 [SE-0168][SE-0168] introduces a simple way for writing multi-line string literals using triple quotes (`"""`). Inside a multi-line string literal, you donʼt need to escape single quotes, which means that most text formats (such as JSON or HTML) can be pasted in without any escaping. The indentation of the closing delimiter determines how much whitespace is stripped from the start of each line.
 
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
 ### String revision

 [SE-0163][SE-0163] is the first part of the revised string model for Swift 4. The biggest change is that `String` is a `Collection` again (as it used to be in the Swift 1 days), i.e. the functionality of `String.CharacterView` has been folded into the parent type. (The other views, `UnicodeScalarView`, `UTF8View`, and `UTF16View`, still exist.)
 
 Note that SE-0163 isnʼt fully implemented yet and there are likely more string-related proposals in the pipeline.

 [SE-0163]: https://github.com/apple/swift-evolution/blob/master/proposals/0163-string-revision-1.md "Swift Evolution Proposal SE-0163: String Revision: Collection Conformance, C Interop, Transcoding"
 */
let greeting = "Hello, 😜!"
// No need to drill down to .characters
greeting.count
for char in greeting {
    print(char)
}

/*:
 String slices are now instances of type `Substring`. Both `String` and `Substring` conform to the `StringProtocol` protocol. Almost the entire string API will live in `StringProtocol` so that `String` and `StringProtocol` behave largely the same.
 */
let comma = greeting.index(of: ",")!
let substring = greeting[..<comma]
type(of: substring)
print(substring.uppercased())

/*:
 ### Unicode 9
 
 Swift 4 will support Unicode 9, fixing [some problems with proper grapheme clustering for modern emoji][Emoji 4.0]. This change [seems to be implemented][Unicode 9 PR], but itʼs not in the snapshot yet (when I last checked). All the character counts below should be `1`.

 [Emoji 4.0]: https://oleb.net/blog/2016/12/emoji-4-0/
 [Unicode 9 PR]: https://github.com/apple/swift/pull/9265
 */
"👧🏽".count // → 2 ❌ (person + skin tone)
"👨‍👩‍👧‍👦".count // → 4 ❌ (four members)
"👱🏾\u{200D}👩🏽\u{200D}👧🏿\u{200D}👦🏻".count // → 8 ❌ (four members + four skin tones, ZWJ isn’t counted)
"👩🏻‍🚒".count // → 3 ❌ (person + skin tone + profession, ZWJ isn’t counted)

/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
