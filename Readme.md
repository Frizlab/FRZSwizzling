# FRZSwizzling
![Platforms](https://img.shields.io/badge/platform-macOS%20|%20iOS%20|%20tvOS%20|%20watchOS%20|%20visionOS-lightgrey.svg?style=flat) [![SPM compatible](https://img.shields.io/badge/SPM-compatible-E05C43.svg?style=flat)](https://swift.org/package-manager/) [![License](https://img.shields.io/github/license/Frizlab/FRZSwizzling.svg)](License.txt) [![happn](https://img.shields.io/badge/from-happn-0087B4.svg?style=flat)](https://happn.com)

A swizzling that works.

## Installation
Either via SPM (recommended), or by copying `NSObject+FRZSwizzling.{h,m}` into your project.

### Important Note
The repository does have an `xcodeproj` with a shared scheme for debug purposes.
The project might be compatible with Carthage–or not.
It is not officially supported but might work for you.

## Usage
```objectivec
@import FRZSwizzling; /* If installed via SPM. */

@implementation NSView (MyViewAdditions)

static void MySetFrame(id self, SEL _cmd, CGRect frame);
static void (*OriginalSetFrame)(id self, SEL _cmd, CGRect frame);

static void MySetFrame(id self, SEL _cmd, CGRect frame) {
   // ***** CUSTOM WORK HERE *****
   OriginalSetFrame(self, _cmd, frame);
   // ***** OR HERE *****
}

+ (void)load
{
   FSZ_CHECKED_SWIZZLE(NSView, setFrame:, MySetFrame, OriginalSetFrame);
}

@end
```

## Developers Notes
The include folder in the FRZSwizzling source code folder is there for SPM-compatibility.
It contains a special `FRZSwizzling.h` umbrella header and a soft link to the other (public) header.

## Credits
This project was originally created by [François Lamboley](https://github.com/Frizlab) while working at [happn](https://happn.com).
