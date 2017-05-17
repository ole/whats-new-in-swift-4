/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

 ## Class and subtype existentials

 You can now write the equivalent of the Objective-C code `UIViewController <SomeProtocol> *` in Swift, i.e. declare a variable of a concrete type and constrain it to one or more protocols at the same time ([SE-0156][SE-0156]).

 [SE-0156]: https://github.com/apple/swift-evolution/blob/master/proposals/0156-subclass-existentials.md "Swift Evolution Proposal SE-0156: Class and Subtype existentials"
 */

import Cocoa

protocol HeaderView {}

class ViewController: NSViewController {
    let header: NSView & HeaderView

    init(header: NSView & HeaderView) {
        self.header = header
        super.init(nibName: nil, bundle: nil)!
    }

    required init(coder decoder: NSCoder) {
        fatalError("not implemented")
    }
}

// ViewController(header: NSView()) // error: argument type 'NSView' does not conform to expected type 'NSView & HeaderView'

extension NSImageView: HeaderView {}

ViewController(header: NSImageView()) // works

/*: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next) */
