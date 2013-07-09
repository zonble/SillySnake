#import <Foundation/Foundation.h>

/*! The data strcuture for representing the size of the world where
    our snake moves. */
typedef struct {
	NSUInteger width;
	NSUInteger height;
} ZBSnakeWorldSize;

ZBSnakeWorldSize ZBMakeSnakeWorldSize(NSUInteger width, NSUInteger height);

/*! The data strcuture whcih represents a point in the world. */
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

/*! The model object which illustrates the shape of a snake, also has
    methods to help changing the moving direction of the snake. */
@interface ZBSnake : NSObject
- (id)initWithWorldSize:(ZBSnakeWorldSize)inWorldSize length:(NSUInteger)inLength;

/*! Move a step forward. The method is supposed to be called by a
    timer. */
- (void)move;
/*! Change the direction of the snake. Returns YES if the direction is
    really changed, otherwise NO.*/
- (BOOL)changeDirection:(ZBSnakeDirection)inDirection;
/*! Increase the length of the snake. It happens when the snake
    meets/eats a fruit. */
- (void)increaseLength:(NSUInteger)inLength;
/*! Return YES if the head of the snake hits its own body. When it
    happens, the game is over. */
- (BOOL)isHeadHitBody;

- (void)lockDirection;
- (void)unlockDirection;

/*! The array of locations where the snake's body occupies in the
    world. */
@property (readonly, nonatomic) NSArray *points;

@end
