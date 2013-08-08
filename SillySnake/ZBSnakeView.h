#import "ZBSnake.h"

@class ZBSnakeView;
@protocol ZBSnakeViewDelegate <NSObject>
/*! Asks the delegate about the snake. */
- (ZBSnake *)snakeForSnakeView:(ZBSnakeView *)inView;
/*! Asks the delegate for where the friut is. */
- (NSValue *)snakePointValueOfFruitForSnakeView:(ZBSnakeView *)inView;
@end

/*! A custom view as the main stage of our snake game.*/
@interface ZBSnakeView : UIView
@property (weak, nonatomic) id <ZBSnakeViewDelegate> delegate;
@end
