/*! The main view controller. */
@interface ZBViewController : UIViewController

/*! Start playing game. */
- (IBAction)start:(id)sender;
/*! Make the snake to move toward left. */
- (IBAction)moveLeft:(id)sender;
/*! Make the snake to move toward right. */
- (IBAction)moveRight:(id)sender;
/*! Make the snake to move toward up. */
- (IBAction)moveUp:(id)sender;
/*! Make the snake to move toward down. */
- (IBAction)moveDown:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *startButton;
@end
