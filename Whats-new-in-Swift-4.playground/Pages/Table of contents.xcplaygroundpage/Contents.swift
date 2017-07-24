/*:
 # What’s new in Swift 4
 
 By [Ole Begemann][Ole Begemann] • May 2017
 
 Latest version tested: **Xcode 9 beta 4 from July 24, 2017**
 
 [Ole Begemann]: https://oleb.net
 
 ## Contents

 1. Instructions (see below)
 1. [One-sided ranges](One-sided%20ranges)
 1. [Strings](Strings)
 1. [Private declarations visible in same-file extensions](private%20in%20same-file%20extensions)
 1. [Key paths](Key%20paths)
 1. [Encoding and decoding](Encoding%20and%20decoding)
 1. [Associated type constraints](Associated%20type%20constraints)
 1. [`Dictionary` and `Set` enhancements](Dictionary%20and%20Set%20enhancements)
 1. [`MutableCollection.swapAt` method](swapAt)
 1. [`reduce` with `inout`](reduce%20with%20inout)
 1. [Generic subscripts](Generic%20subscripts)
 1. [New integer protocols](Integer%20protocols)
 1. [`NSNumber` bridging](NSNumber%20bridging)
 1. [`Limiting @objc inference`](Limiting%20@objc%20inference)
 1. [Composing classes and protocols](Composing%20classes%20and%20protocols)

 ## Instructions

 This playground requires Swift 4. Xcode 9 includes Swift 4 by default ([download Xcode 9 beta from developer.apple.com](https://developer.apple.com/download/))). You can also run it in Xcode 8.3, but you need to install a Swift 4 toolchain (don’t worry, it’s easy):

 1. Download [the latest Swift 4.0 snapshot from swift.org](https://swift.org/download/#snapshots).
 1. Run the installer to install the snapshot.
 1. In Xcode, go to _Xcode > Toolchains > Manage Toolchains…_ and select the snapshot:
 
    ![Screenshot of Swift toolchain selection in Xcode 8.3 preferences](xcode-8-3-toolchain-dialog.png)
 
    It might be a good idea to quit and relaunch Xcode after switching snapshots. I occasionally had problems with syntax highlighting and code completion that a relaunch fixed.
 
    If you want to switch between multiple Swift versions on the command line (e.g. to play with Swift 4 in the REPL or to build Swift packages with Swift 4, I recommend Kyle Fuller’s excellent [swiftenv](https://swiftenv.fuller.li/).

 [Next page](@next)
 */

