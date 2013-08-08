#import "ZBSnakeView.h"

@implementation ZBSnakeView

- (void)drawRect:(CGRect)rect
{
	ZBSnake *snake = [self.delegate snakeForSnakeView:self];
	ZBSnakeWorldSize worldSize = snake.worldSize;
	if (worldSize.width <= 0 || worldSize.height <= 0) {
		return;
	}
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGFloat w = self.bounds.size.width/worldSize.width;
	CGFloat h = self.bounds.size.height/worldSize.height;

	if (snake) {
		NSArray *points = snake.points;
		[[UIColor blackColor] set];

		for (NSValue *value in points) {
			ZBSnakePoint point = [value snakePointValue];
			CGRect rect = CGRectMake(w*point.x, h*point.y, w, h);
			CGContextFillRect(ctx, rect);
		}
	}

	NSValue *fruit = [self.delegate snakePointValueOfFruitForSnakeView:self];
	if (fruit) {
		[[UIColor redColor] set];
		ZBSnakePoint point = [fruit snakePointValue];
		CGRect rect = CGRectMake(w*point.x, h*point.y, w, h);
		CGContextFillEllipseInRect(ctx, rect);
	}
}

@end
