//
//  LoginView.m
//  TemplateProject
//
//  Created by djzhang on 1/14/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView


#pragma mark -
#pragma mark - View Lifecycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {

        // 1. Load the .xib
        [[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:self options:nil];

        // 2. Setup subview
        [self addSubview:self.view];
    }
    return self;
}


#pragma mark -
#pragma mark

- (IBAction)login:(id)sender {
    if([self.callerdelegate respondsToSelector:self.callbackSuccess]) {
        [self.callerdelegate performSelector:self.callbackSuccess withObject:@"sucess"];
    }
}


@end
