#import <UIKit/UIKit.h>
#import "ZBSnake.h"

@class ZBSnakeView;
@protocol ZBSnakeViewDelegate <NSObject>
- (ZBSnakeWorldSize)worldSizeForSnakeView:(ZBSnakeView *)inView;
- (ZBSnake *)snakeForSnakeView:(ZBSnakeView *)inView;
- (NSValue *)snakePointValueOfFruitForSnakeView:(ZBSnakeView *)inView;
@end

@interface ZBSnakeView : UIView
@property (weak, nonatomic) id <ZBSnakeViewDelegate> delegate;
@end
