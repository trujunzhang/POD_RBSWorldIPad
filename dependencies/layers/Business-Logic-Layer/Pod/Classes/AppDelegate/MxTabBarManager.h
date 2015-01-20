#import <UIKit/UIKit.h>


@interface MxTabBarManager : NSObject

+ (MxTabBarManager *)sharedTabBarManager;

- (void)registerNavigationController:(UINavigationController *)navigationController;

- (void)pushLoginViewController;

- (void)pushYoutubeVideoListViewController;

- (void)presentYouTubeVideoToPlay:(NSString *)videoID;
@end
