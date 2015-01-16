//
//  LoginViewController.m
//  TemplateProject
//
//  Created by djzhang on 1/14/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"


@interface LoginViewController () {
    LoginView *_loginView;
}
@end


@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UIView *mLogViewPanel;

@end


@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _loginView = [[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:self options:nil][0];
    [self.mLogViewPanel addSubview:_loginView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotate {
    return YES;
}


- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}


@end
