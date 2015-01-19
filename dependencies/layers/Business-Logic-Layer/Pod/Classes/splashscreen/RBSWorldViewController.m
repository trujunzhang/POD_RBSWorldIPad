//
// Created by djzhang on 1/15/15.
// Copyright (c) 2015 djzhang. All rights reserved.
//

#import "RBSWorldViewController.h"
#import "LoginViewController.h"
#import "MxTabBarManager.h"

@interface RBSWorldViewController () {

    IBOutlet UIImageView *backgroundImageView;
}
@end

@implementation RBSWorldViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self performSelector:@selector(gotoDashboard:) withObject:self afterDelay:6.0];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES];
}

- (void)gotoDashboard:(id)sender {
    [[MxTabBarManager sharedTabBarManager] pushLoginViewController];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    UIInterfaceOrientation toInterfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
    BOOL isPortrait = (toInterfaceOrientation == UIInterfaceOrientationPortrait) || (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);

    if(isPortrait) {
        backgroundImageView.image = [UIImage imageNamed:@"Default-Portrait.png"];
    } else {
        backgroundImageView.image = [UIImage imageNamed:@"Default-Landscape.png"];
    }
}

@end