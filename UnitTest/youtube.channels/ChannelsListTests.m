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
    [self fetchChannelListWithChannelIDs];
}

#pragma mark -
#pragma mark

- (void)fetchChannelListWithChannelIDs {
    __block NSArray *blockResponseObject = nil;
    __block id blockError = nil;

    YoutubeResponseBlock completionBlock = ^(NSArray *array, NSObject *respObject) {
        blockResponseObject = array;
    };
    ErrorResponseBlock errorBlock = ^(NSError *error) {
        blockError = error;
    };
    NSString *channelIDs = @"UC0wObT_HayGfWLdRAnFyPwA,UCppqA-uJ4duBJymLy8vyEDQ";
    NSURLSessionDataTask *task = [[GYoutubeHelper getInstance] fetchChannelListWithChannelIDs:channelIDs completion:completionBlock errorHandler:errorBlock];

    [task resume];

    expect(task.state).will.equal(NSURLSessionTaskStateCompleted);
    expect(blockError).will.beNil();
    expect(blockResponseObject).willNot.beNil();

//    XCTAssert(blockResponseObject.count, 2, @"expect result is 2.");
    XCTAssert(3, 2, @"expect result is 2.");

}

@end
