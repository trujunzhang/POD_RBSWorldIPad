#import "MxTabBarManager.h"
#import "LoginViewController.h"
#import "YoutubeVideoListViewController.h"


@interface MxTabBarManager () {
    UINavigationController *_navigationController;
}


@end


@implementation MxTabBarManager

- (instancetype)init {
    self = [super init];
    if(self) {
    }

    return self;
}


+ (MxTabBarManager *)sharedTabBarManager {
    static MxTabBarManager *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[MxTabBarManager alloc] init];
    });

    return cache;
}


- (void)registerNavigationController:(UINavigationController *)navigationController {
    _navigationController = navigationController;
}

#pragma mark -
#pragma mark

- (void)pushLoginViewController {
    LoginViewController *loginViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"loginViewController"];
    [_navigationController pushViewController:loginViewController animated:YES];
}

- (void)pushYoutubeVideoListViewController {
    YoutubeVideoListViewController *youtubeVideoListViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"YoutubeVideoListViewController"];
    [_navigationController pushViewController:youtubeVideoListViewController animated:YES];
}


@end
