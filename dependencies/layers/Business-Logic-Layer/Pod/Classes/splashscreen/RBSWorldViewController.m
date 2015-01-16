//
// Created by djzhang on 1/15/15.
// Copyright (c) 2015 djzhang. All rights reserved.
//

#import "RBSWorldViewController.h"
#import "LoginViewController.h"

@interface RBSWorldViewController () {

    IBOutlet UIImageView *splashscreenBgViewer;
}
@end

@implementation RBSWorldViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self performSelector:@selector(gotoDashboard:) withObject:self afterDelay:1.0];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES];
}

- (void)gotoDashboard:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
    [self.navigationController pushViewController:loginViewController animated:NO];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    UIInterfaceOrientation toInterfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
    BOOL isPortrait = (toInterfaceOrientation == UIInterfaceOrientationPortrait) || (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);

    if(isPortrait) {
        splashscreenBgViewer.image = [UIImage imageNamed:@"Default-Portrait.png"];
    } else {
        splashscreenBgViewer.image = [UIImage imageNamed:@"Default-Landscape.png"];
    }
}

@end