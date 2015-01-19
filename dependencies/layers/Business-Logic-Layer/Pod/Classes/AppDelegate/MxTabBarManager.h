#import <UIKit/UIKit.h>


@interface MxTabBarManager : NSObject

+ (MxTabBarManager *)sharedTabBarManager;

- (void)registerNavigationController:(UINavigationController *)navigationController;

- (void)pushLoginViewController;
@end
