//
//  LoginViewController.m
//  TemplateProject
//
//  Created by djzhang on 1/14/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "YoutubeVideoListViewController.h"

@interface LoginViewController () {
    IBOutlet LoginView *loginView;
}
@end


@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UIView *mLogViewPanel;

@end


@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    loginView.callerdelegate = self;
    loginView.callbackSuccess = @selector(loginSuccessfully:);
}

- (void)loginSuccessfully:(NSString *)message {
    YoutubeVideoListViewController *loginViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"YoutubeVideoListViewController"];
    [self.navigationController pushViewController:loginViewController animated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
//    [loginView:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


@end
