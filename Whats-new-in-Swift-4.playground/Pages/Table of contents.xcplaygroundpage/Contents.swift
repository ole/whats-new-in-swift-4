/*:
 # Whatʼs new in Swift 4
 
 By [Ole Begemann][Ole Begemann] • May 2017
 
 Latest toolchain tested: **Swift 4.0 Development from June 2, 2017.**
 
 [Ole Begemann]: https://oleb.net
 
 ## Contents

 1. Instructions (see below)
 1. [One-sided ranges](One-sided%20ranges)
 1. [Strings](Strings)
 1. [Private declarations visible in same-file extensions](private%20in%20same-file%20extensions)
 1. [Key paths](Key%20paths)
 1. [Encoding and decoding](Encoding%20and%20decoding)
 1. [`Sequence.Element`](Sequence.Element)
 1. [`Dictionary` and `Set` enhancements](Dictionary%20and%20Set%20enhancements)
 1. [`MutableCollection.swapAt` method](swapAt)
 1. [`reduce` with `inout`](reduce%20with%20inout)
 1. [Generic subscripts](Generic%20subscripts)
 1. [`NSNumber` bridging](NSNumber%20bridging)
 1. [Class and subtype existentials](Class%20and%20subtype%20existentials)

 ## Instructions

 This playground requires Swift 4. To run it in Xcode 8.3 (before Xcode 9 becomes available):
 
 1. Download [the latest Swift 4.0 snapshot from swift.org][Snapshot downloads].
 1. Run the installer to install the snapshot.
 1. In Xcode, go to _Xcode > Toolchains > Manage Toolchains…_ and select the snapshot:
 
    ![][xcode-8-3-toolchain-dialog]
 
    It might be a good idea to quit and relaunch Xcode after switching snapshots. I had occasional problems with syntax highlighting and code completion that a relaunch fixed.
 
    If you want to switch between multiple Swift versions on the command line (e.g. to play with Swift 4 in the REPL or to build Swift packages with Swift 4, I recommend Kyle Fullerʼs excellent [swiftenv][swiftenv].
 
 [Snapshot downloads]: https://swift.org/download/#snapshots
 [xcode-8-3-toolchain-dialog]: xcode-8-3-toolchain-dialog.png
 [swiftenv]: https://swiftenv.fuller.li/

 [Next page](@next)
 */

