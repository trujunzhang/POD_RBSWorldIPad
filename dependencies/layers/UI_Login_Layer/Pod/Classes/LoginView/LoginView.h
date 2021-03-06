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
@property (strong, nonatomic) IBOutlet UITextField *textFieldLoginName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldPassword;

@property (readwrite, retain) id callerdelegate;
@property (nonatomic, assign) SEL callbackSuccess;

- (IBAction)login:(id)sender;

@end
