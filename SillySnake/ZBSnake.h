#import <Foundation/Foundation.h>

typedef struct {
	NSUInteger width;
	NSUInteger height;
} ZBSnakeWorldSize;

ZBSnakeWorldSize ZBMakeSnakeWorldSize(NSUInteger width, NSUInteger height);

typedef struct {
	NSUInteger x;
	NSUInteger y;
} ZBSnakePoint;

ZBSnakePoint ZBMakeSnakePoint(NSUInteger x, NSUInteger y);

@interface NSValue (ZBSnakePoint)
+ (id)valueWithSnakePoint:(ZBSnakePoint)inPoint;
- (ZBSnakePoint)snakePointValue;
@end

typedef enum {
	ZBSnakeDirectionLeft,
	ZBSnakeDirectionUp,
	ZBSnakeDirectionRight,
	ZBSnakeDirectionDown
} ZBSnakeDirection;

@interface ZBSnake : NSObject
- (id)initWithWorldSize:(ZBSnakeWorldSize)inWorldSize length:(NSUInteger)inLength;
- (void)move;
- (BOOL)changeDirection:(ZBSnakeDirection)inDirection;
- (void)increaseLength:(NSUInteger)inLength;
- (BOOL)isHeadHitBody;
- (void)lockDirection;
- (void)unlockDirection;

@property (readonly, nonatomic) NSArray *points;

@end
