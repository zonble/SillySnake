#import "ZBViewController.h"
#import "ZBSnakeView.h"

@interface ZBViewController () <ZBSnakeViewDelegate>
{
	ZBSnakeWorldSize worldSize;
}
- (void)makeNewFruit;
- (void)startGame;
- (void)endGame;

@property (retain, nonatomic) ZBSnake *snake;
@property (retain, nonatomic) NSTimer *timer;
@property (retain, nonatomic) NSValue *fruitPoint;
@property (retain, nonatomic) IBOutlet ZBSnakeView *snakeView;
@end

@implementation ZBViewController

- (void)addGestureRecognizerWithDirection:(UISwipeGestureRecognizerDirection)direction
{
	UISwipeGestureRecognizer *gr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
	gr.direction = direction;
	[self.snakeView addGestureRecognizer:gr];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self setWantsFullScreenLayout:YES];	
	worldSize = ZBMakeSnakeWorldSize(24, 15);
	self.snakeView.delegate = self;
	[self addGestureRecognizerWithDirection:UISwipeGestureRecognizerDirectionLeft];
	[self addGestureRecognizerWithDirection:UISwipeGestureRecognizerDirectionRight];
	[self addGestureRecognizerWithDirection:UISwipeGestureRecognizerDirectionUp];
	[self addGestureRecognizerWithDirection:UISwipeGestureRecognizerDirectionDown];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (void)timerMethod:(NSTimer *)inTimer
{
	[self.snake move];
	if ([self.snake isHeadHitBody]) {
		[self endGame];
		return;
	}
	ZBSnakePoint head = [self.snake.points[0] snakePointValue];
	ZBSnakePoint friut = [self.fruitPoint snakePointValue];
	if (head.x == friut.x && head.y == friut.y) {
		[self.snake increaseLength:2];
		[self makeNewFruit];
	}

	[self.snake unlockDirection];
	[self.snakeView setNeedsDisplay];
}

- (void)makeNewFruit
{
	srandomdev();
	NSInteger x = 0;
	NSInteger y = 0;
	while (1) {
		x = random() % worldSize.width;
		y = random() % worldSize.height;
		BOOL inBody = NO;
		for (NSValue *v in self.snake.points) {
			ZBSnakePoint point = [v snakePointValue];
			if (point.x == x && point.y == y) {
				inBody = YES;
				break;
			}
		}
		if (!inBody) {
			break;
		}
	}
	self.fruitPoint = [NSValue valueWithSnakePoint:ZBMakeSnakePoint(x, y)];
}

- (void)startGame
{
	if (self.timer) {
		return;
	}
	self.startButton.hidden = YES;

	self.snake = [[ZBSnake alloc] initWithWorldSize:worldSize length:2];
	[self makeNewFruit];
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerMethod:) userInfo:nil repeats:YES];
}
- (void)endGame
{
	self.startButton.hidden = NO;
	[self.timer invalidate];
	self.timer = nil;
}

- (void)swipe:(UISwipeGestureRecognizer *)gr
{
	UISwipeGestureRecognizerDirection direction = gr.direction;
	NSDictionary *directionMap = @{@(UISwipeGestureRecognizerDirectionRight): @"moveRight:",
								   @(UISwipeGestureRecognizerDirectionLeft): @"moveLeft:",
								   @(UISwipeGestureRecognizerDirectionUp): @"moveUp:",
								   @(UISwipeGestureRecognizerDirectionDown): @"moveDown:"};
	[(id)self performSelector:NSSelectorFromString(directionMap[@(direction)]) withObject:self];
}

- (IBAction)start:(id)sender
{
	[self startGame];
}
- (IBAction)moveLeft:(id)sender
{
	if ([self.snake changeDirection:ZBSnakeDirectionLeft]) {
		[self.snake lockDirection];
	}
}
- (IBAction)moveRight:(id)sender
{
	if ([self.snake changeDirection:ZBSnakeDirectionRight]) {
		[self.snake lockDirection];
	}
}
- (IBAction)moveUp:(id)sender
{
	if ([self.snake changeDirection:ZBSnakeDirectionUp]) {
		[self.snake lockDirection];
	}
}
- (IBAction)moveDown:(id)sender
{
	if ([self.snake changeDirection:ZBSnakeDirectionDown]) {
		[self.snake lockDirection];
	}
}

#pragma mark -
#pragma mark ZBSnakeViewDelegate

- (ZBSnakeWorldSize)worldSizeForSnakeView:(ZBSnakeView *)inView
{
	return worldSize;
}
- (ZBSnake *)snakeForSnakeView:(ZBSnakeView *)inView
{
	return self.snake;
}
- (NSValue *)snakePointValueOfFruitForSnakeView:(ZBSnakeView *)inView
{
	return self.fruitPoint;
}

@end
