//
//  LoginView.h
//  TemplateProject
//
//  Created by djzhang on 1/14/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;

- (IBAction)login:(id)sender;

- (BOOL)checkTextView:(UITextField *)field;
@end
