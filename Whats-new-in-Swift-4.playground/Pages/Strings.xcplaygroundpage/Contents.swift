/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 
 ## Strings

 ### Multi-line string literals

 [SE-0168][SE-0168] introduces a simple syntax for multi-line string literals using triple quotes (`"""`). Inside a multi-line string literal, you donʼt need to escape single quotes, which means that most text formats (such as JSON or HTML) can be pasted in without any escaping. The indentation of the closing delimiter determines how much whitespace is stripped from the start of each line.
 
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
 Activate the Console (_View > Debug Area > Activate Console_) to see the `print` output.

 ### String is a `Collection` again

 [SE-0163][SE-0163] is the first part of the revised string model for Swift 4. The biggest change is that `String` is a `Collection` again (as it used to be in Swift 1.x), i.e. the functionality of `String.CharacterView` has been folded into the parent type. (The other views, `UnicodeScalarView`, `UTF8View`, and `UTF16View`, still exist.)
 
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
 ### `Substring` is the new type for string slices

 String slices are now instances of type `Substring`. Both `String` and `Substring` conform to `StringProtocol`. Almost the entire string API will live in `StringProtocol` so that `String` and `Substring` behave largely the same.
 */
let comma = greeting.index(of: ",")!
let substring = greeting[..<comma]
type(of: substring)
// String API can be called on Substring
print(substring.uppercased())
/*:
 ### Unicode 9
 
 Swift 4 will support Unicode 9, fixing [some problems with proper grapheme clustering for modern emoji][Emoji 4.0]. All the character counts below are now `1`, as they should be:

 [Emoji 4.0]: https://oleb.net/blog/2016/12/emoji-4-0/
 */
"👧🏽".count // person + skin tone
"👨‍👩‍👧‍👦".count // family with four members
"👱🏾\u{200D}👩🏽\u{200D}👧🏿\u{200D}👦🏻".count // family + skin tones
"👩🏻‍🚒".count // person + skin tone + profession

/*:
 ### `Character.unicodeScalars` property
 
 You can now access the code points of a `Character` directly without having to convert it to a `String` first ([SE-0178][SE-0178]):

 [SE-0178]: https://github.com/apple/swift-evolution/blob/master/proposals/0178-character-unicode-view.md "Swift Evolution Proposal SE-0178: Add `unicodeScalars` property to `Character`"
 */
let c: Character = "🇪🇺"
Array(c.unicodeScalars)

/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
