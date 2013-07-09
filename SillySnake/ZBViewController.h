#import <UIKit/UIKit.h>

@interface ZBViewController : UIViewController

- (IBAction)start:(id)sender;
- (IBAction)moveLeft:(id)sender;
- (IBAction)moveRight:(id)sender;
- (IBAction)moveUp:(id)sender;
- (IBAction)moveDown:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *startButton;
@end
