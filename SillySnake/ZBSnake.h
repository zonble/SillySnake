#import <Foundation/Foundation.h>

/*! The structure for representing the size of the world where our
	snake moves. */
typedef struct {
	NSUInteger width;
	NSUInteger height;
} ZBSnakeWorldSize;

/*! Creates a new ZBSnakeWorldSize from the specified values.
	@param	width	width of the world.
	@param	height	height of the world.
	@return	a new ZBSnakeWorldSize. */
ZBSnakeWorldSize ZBMakeSnakeWorldSize(NSUInteger width, NSUInteger height);

/*! The structure whcih represents a point in the world. */
typedef struct {
	NSUInteger x;
	NSUInteger y;
} ZBSnakePoint;

/*! Creates a new ZBSnakePoint from the specified values.
	@param	x	The x-coordinate of the point.
	@param	y	The y-coordinate of the point.
	@return	a new ZBSnakePoint.*/
ZBSnakePoint ZBMakeSnakePoint(NSUInteger x, NSUInteger y);

@interface NSValue (ZBSnakePoint)
/*! Creates and returns a value object that contains the specified
	point structure. */
+ (id)valueWithSnakePoint:(ZBSnakePoint)inPoint;
/*! Returns a point structure representing the data in the
	receiver. */
- (ZBSnakePoint)snakePointValue;
@end

/*! Direction of a snake. */
typedef enum {
	ZBSnakeDirectionLeft,
	ZBSnakeDirectionUp,
	ZBSnakeDirectionRight,
	ZBSnakeDirectionDown
} ZBSnakeDirection;

/*! The model object which illustrates the shape of a snake, also has
	methods to help changing the moving direction of the snake. */
@interface ZBSnake : NSObject

/*! Initialize a new ZBSnake.
	@param	inWorldSize	the size of the world where the snake lives in.
	@param	inLength	initial length of the snake.
	@return	a new ZBSnake. */
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
