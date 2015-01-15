//
// Created by djzhang on 1/15/15.
// Copyright (c) 2015 djzhang. All rights reserved.
//

#import "RBSWorldViewController.h"

@interface RBSWorldViewController () {

    IBOutlet UIImageView *splashscreenBgViewer;
}
@end

@implementation RBSWorldViewController {

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