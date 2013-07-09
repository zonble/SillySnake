#import <XCTest/XCTest.h>
#import "ZBSnake.h"

@interface SillySnakeTests : XCTestCase

@end

@implementation SillySnakeTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.

    [super tearDown];
}

//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

- (void)testSnakePoint
{
	NSValue *value = [NSValue valueWithSnakePoint:ZBMakeSnakePoint(10, 20)];
	ZBSnakePoint point = [value snakePointValue];
	XCTAssertTrue(point.x == 10, @"x must be 10");
	XCTAssertTrue(point.y == 20, @"y must be 20");
}

@end
