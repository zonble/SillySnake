#import "ZBSnake.h"

ZBSnakeWorldSize ZBMakeSnakeWorldSize(NSUInteger width, NSUInteger height)
{
	ZBSnakeWorldSize size;
	size.width = width;
	size.height = height;
	return size;
}

ZBSnakePoint ZBMakeSnakePoint(NSUInteger x, NSUInteger y)
{
	ZBSnakePoint point;
	point.x = x;
	point.y = y;
	return point;
}

@implementation NSValue (ZBSnakePoint)
+ (id)valueWithSnakePoint:(ZBSnakePoint)inPoint
{
	return	[NSValue valueWithBytes:&inPoint objCType:@encode(ZBSnakePoint)];
}
- (ZBSnakePoint)snakePointValue
{
	if (strcmp([self objCType], @encode(ZBSnakePoint)) == 0) {
		ZBSnakePoint origin;
		[self getValue:&origin];
		return origin;
	}
	return ZBMakeSnakePoint(0, 0);
}
@end

@interface ZBSnake ()
{
	NSMutableArray *points;
	ZBSnakeWorldSize worldSize;
	ZBSnakeDirection direction;
	BOOL directionLocked;
}
@end

@implementation ZBSnake

- (id)initWithWorldSize:(ZBSnakeWorldSize)inWorldSize length:(NSUInteger)inLength
{
	self = [super init];
	if (self) {
		points = [[NSMutableArray alloc] init];
		worldSize = inWorldSize;
		direction = ZBSnakeDirectionLeft;
		NSUInteger x = (NSUInteger)(worldSize.width / 2.0);
		NSUInteger y = (NSUInteger)(worldSize.height / 2.0);
		for (NSInteger i = 0; i < inLength; i++) {
			[points addObject:[NSValue valueWithSnakePoint:ZBMakeSnakePoint(x + i, y)]];
		}
	}
	return self;
}

- (void)move
{
	[points removeObject:[points lastObject]];
	ZBSnakePoint firstPoint = [points[0] snakePointValue];
	NSInteger x = firstPoint.x;
	NSInteger y = firstPoint.y;
	switch (direction) {
		case ZBSnakeDirectionLeft:
			if (--x < 0) x = worldSize.width - 1;
			break;
		case ZBSnakeDirectionUp:
			if (--y < 0) y = worldSize.height - 1;
			break;
		case ZBSnakeDirectionRight:
			if (++x >= worldSize.width) x = 0;
			break;
		case ZBSnakeDirectionDown:
			if (++y >= worldSize.height) y = 0;
		default:
			break;
	}
	[points insertObject:[NSValue valueWithSnakePoint:ZBMakeSnakePoint(x, y)] atIndex:0];
}

- (BOOL)changeDirection:(ZBSnakeDirection)inDirection
{
	if (directionLocked) {
		return NO;
	}
	if (inDirection == ZBSnakeDirectionLeft || inDirection == ZBSnakeDirectionRight) {
		if (direction == ZBSnakeDirectionUp || direction == ZBSnakeDirectionDown) {
			direction = inDirection;
			return YES;
		}
	}
	if (inDirection == ZBSnakeDirectionUp || inDirection == ZBSnakeDirectionDown) {
		if (direction == ZBSnakeDirectionLeft || direction == ZBSnakeDirectionRight) {
			direction = inDirection;
			return YES;
		}
	}
	return NO;
}

- (void)increaseLength:(NSUInteger)inLength
{
	ZBSnakePoint lastPoint = [[points lastObject] snakePointValue];
	ZBSnakePoint theOneBeforeLastPoint = [[points objectAtIndex:[points count]-2] snakePointValue];
	NSInteger x = lastPoint.x - theOneBeforeLastPoint.x;
	NSInteger y = lastPoint.y - theOneBeforeLastPoint.y;
	for (NSInteger i = 0; i < inLength; i++) {
		NSInteger theX = (lastPoint.x + x *i) % worldSize.width;
		NSInteger theY = (lastPoint.y + y *i) % worldSize.height;
		[points addObject:[NSValue valueWithSnakePoint:ZBMakeSnakePoint(theX, theY)]];
	}
}

- (BOOL)isHeadHitBody
{
	ZBSnakePoint firstPoint = [points[0] snakePointValue];
	for (NSInteger i = 1; i < [points count]; i++) {
		ZBSnakePoint point = [points[i] snakePointValue];
		if (point.x == firstPoint.x && point.y == firstPoint.y) {
			return YES;
		}
	}
	return NO;
}

- (void)lockDirection
{
	directionLocked = YES;
}
- (void)unlockDirection
{
	directionLocked = NO;
}

@synthesize points;

@end
