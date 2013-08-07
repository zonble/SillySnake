#import <XCTest/XCTest.h>
#import "ZBSnake.h"

@interface SillySnakeTests : XCTestCase

@end

@implementation SillySnakeTests

- (void)setUp
{
	[super setUp];
}

- (void)tearDown
{
	[super tearDown];
}

- (void)testSnakePoint
{
	NSValue *value = [NSValue valueWithSnakePoint:ZBMakeSnakePoint(10, 20)];
	ZBSnakePoint point = [value snakePointValue];
	XCTAssertTrue(point.x == 10, @"x must be 10");
	XCTAssertTrue(point.y == 20, @"y must be 20");
}

- (void)testHit
{
	ZBSnake *snake = [[ZBSnake alloc] initWithWorldSize:ZBMakeSnakeWorldSize(10, 10) length:6];
	[snake changeDirection:ZBSnakeDirectionUp];
	[snake move];
	[snake changeDirection:ZBSnakeDirectionRight];
	[snake move];
	[snake changeDirection:ZBSnakeDirectionDown];
	[snake move];
	XCTAssertEqual([snake isHeadHitBody], YES, @"must hit the body.");
}

- (void)testIncreaseLength
{
	ZBSnake *snake = [[ZBSnake alloc] initWithWorldSize:ZBMakeSnakeWorldSize(10, 10) length:2];
	XCTAssertEqual((int)[snake.points count], 2, @"Length must be 2 but %d", [snake.points count]);
	NSInteger x;
	NSInteger y;
	x = [snake.points[[snake.points count] - 1] snakePointValue].x;
	y = [snake.points[[snake.points count] - 1] snakePointValue].y;
	XCTAssertEqual(x, 6, @"must be 6");
	XCTAssertEqual(y, 5, @"must be 5");

	[snake increaseLength:2];
	XCTAssertEqual((int)[snake.points count], 4, @"Length must be 4 but %d", [snake.points count]);
	x = [snake.points[[snake.points count] - 1] snakePointValue].x;
	y = [snake.points[[snake.points count] - 1] snakePointValue].y;
	XCTAssertEqual(x, 8, @"must be 8");
	XCTAssertEqual(y, 5, @"must be 5");

	[snake increaseLength:2];
	XCTAssertEqual((int)[snake.points count], 6, @"Length must be 6 but %d", [snake.points count]);
	x = [snake.points[[snake.points count] - 1] snakePointValue].x;
	y = [snake.points[[snake.points count] - 1] snakePointValue].y;
	XCTAssertEqual(x, 0, @"must be 0");
	XCTAssertEqual(y, 5, @"must be 5");

	[snake increaseLength:2];
	XCTAssertEqual((int)[snake.points count], 8, @"Length must be 8 but %d", [snake.points count]);
	x = [snake.points[[snake.points count] - 1] snakePointValue].x;
	y = [snake.points[[snake.points count] - 1] snakePointValue].y;
	XCTAssertEqual(x, 2, @"must be 2");
	XCTAssertEqual(y, 5, @"must be 5");
}

- (void)testMoveUp
{
	ZBSnake *snake = [[ZBSnake alloc] initWithWorldSize:ZBMakeSnakeWorldSize(10, 10) length:2];
	NSInteger x;
	NSInteger y;
	[snake changeDirection:ZBSnakeDirectionUp];

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 4, @"Must be 4, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 3, @"Must be 3, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 2, @"Must be 2, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 1, @"Must be 1, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 0, @"Must be 0, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 9, @"Must be 9, but %d", y);
}

- (void)testMoveDown
{
	ZBSnake *snake = [[ZBSnake alloc] initWithWorldSize:ZBMakeSnakeWorldSize(10, 10) length:2];
	NSInteger x;
	NSInteger y;
	[snake changeDirection:ZBSnakeDirectionDown];

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 6, @"Must be 6, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 7, @"Must be 7, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 8, @"Must be 8, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 9, @"Must be 9, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 0, @"Must be 0, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 5, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 1, @"Must be 1, but %d", y);
}

- (void)testMoveLeft
{
	ZBSnake *snake = [[ZBSnake alloc] initWithWorldSize:ZBMakeSnakeWorldSize(10, 10) length:2];
	NSInteger x;
	NSInteger y;

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 4, @"Must be 4, but %d", x);
	XCTAssertEqual(y, 5, @"Must be 5, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 3, @"Must be 3, but %d", x);
	XCTAssertEqual(y, 5, @"Must be 5, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 2, @"Must be 2, but %d", x);
	XCTAssertEqual(y, 5, @"Must be 5, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 1, @"Must be 1, but %d", x);
	XCTAssertEqual(y, 5, @"Must be 5, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 0, @"Must be 0, but %d", x);
	XCTAssertEqual(y, 5, @"Must be 5, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 9, @"Must be 9, but %d", x);
	XCTAssertEqual(y, 5, @"Must be 5, but %d", y);
}

- (void)testMoveRight
{
	ZBSnake *snake = [[ZBSnake alloc] initWithWorldSize:ZBMakeSnakeWorldSize(10, 10) length:2];
	NSInteger x;
	NSInteger y;
	[snake changeDirection:ZBSnakeDirectionUp];
	[snake move];
	[snake changeDirection:ZBSnakeDirectionRight];
	[snake move];

	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 6, @"Must be 5, but %d", x);
	XCTAssertEqual(y, 4, @"Must be 4, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 7, @"Must be 7, but %d", x);
	XCTAssertEqual(y, 4, @"Must be 4, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 8, @"Must be 8, but %d", x);
	XCTAssertEqual(y, 4, @"Must be 4, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 9, @"Must be 9, but %d", x);
	XCTAssertEqual(y, 4, @"Must be 4, but %d", y);

	[snake move];
	x = [snake.points[0] snakePointValue].x;
	y = [snake.points[0] snakePointValue].y;
	XCTAssertEqual(x, 0, @"Must be 0, but %d", x);
	XCTAssertEqual(y, 4, @"Must be 4, but %d", y);
}

@end
