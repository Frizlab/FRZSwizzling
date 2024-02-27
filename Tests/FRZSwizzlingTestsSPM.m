/*
Copyright 2019 happn

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. */

@import Foundation;
@import XCTest;

@import FRZSwizzling;

#import "Helpers/FSZSimpleObject.h"
#import "Helpers/FSZSimpleObject+Swizzling.h"



void _FRZSwizzling_heyTheresARealSymbolInThisLib_(void);


/* Should it be FSZFRZSwizzlingTestsSPM?
 * The mystery remains; I’ll settle on: no.
 * Rationale: the class is not published, so we don’t care about its prefix. */
@interface FRZSwizzlingTestsSPM : XCTestCase
@end


/* SPM does not allow mixing languages, so we do the tests in ObjC for SPM. */
@implementation FRZSwizzlingTestsSPM

- (void)setUp
{
	witnesses = [NSMutableDictionary new];
}

- (void)testSimpleSwizzleAtLoad
{
	assert(witnesses.count == 0);
	[[FSZSimpleObject0 new] doTest1];
	XCTAssertEqual(witnesses[@"test1"], @YES);
	XCTAssertEqual(witnesses[@"MyL0Test1"], @YES);
}

- (void)testSimpleSwizzleInChild
{
	assert(witnesses.count == 0);
	doSimpleChildSwizzle();
	[[FSZSimpleObject1 new] doTest2];
	XCTAssertEqual(witnesses[@"test2"], @YES);
	XCTAssertEqual(witnesses[@"MyL1Test2"], @YES);
}

- (void)testDoubleInvertedSwizzle
{
	assert(witnesses.count == 0);
	doDoubleInvertedSwizzle();
	[[FSZSimpleObject2 new] doTest3];
	XCTAssertEqual(witnesses[@"test3"], @YES);
	XCTAssertEqual(witnesses[@"MyL1Test3"], @YES);
	XCTAssertEqual(witnesses[@"MyL2Test3"], @YES);
}

@end
