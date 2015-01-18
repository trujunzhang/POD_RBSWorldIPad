//
//  ChannelsListTests.m
//  mxAsTubeiPad
//
//  Created by djzhang on 1/18/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GYoutubeHelper.h"
#import "AppTestCase.h"

@interface ChannelsListTests : AppTestCase

@end

@implementation ChannelsListTests

- (void)testFetchChannelListWithChannelIDs {
    [Expecta setAsynchronousTestTimeout:15.0];

    YoutubeResponseBlock completionBlock = ^(NSArray *array, NSObject *respObject) {
        NSString *debug = @"debug";
    };
    ErrorResponseBlock errorBlock = ^(NSError *error) {
        NSString *debug = @"debug";
    };
    NSString *channelIDs = @"UC0wObT_HayGfWLdRAnFyPwA,UCppqA-uJ4duBJymLy8vyEDQ";
    NSURLSessionDataTask *task = [[GYoutubeHelper getInstance] fetchChannelListWithChannelIDs:channelIDs completion:completionBlock errorHandler:errorBlock];
    [task resume];

}

@end
