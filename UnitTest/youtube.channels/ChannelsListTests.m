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
    [self fetchSubscriptionListWithChannelIDMAB];
}

#pragma mark -
#pragma mark fetching CHANNEL LIST

- (void)fetchChannelListWithChannelIDs {
    __block NSArray *blockResponseObject = nil;
    __block id blockError = nil;

    YoutubeResponseBlock completionBlock = ^(NSMutableArray *array, NSObject *respObject) {
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

    expect(blockResponseObject.count).to.equal(2);
    expect([blockResponseObject[0] class]).to.equal([MABYT3_Channel class]);
}


#pragma mark -
#pragma mark fetching SUBSCRIPTIONS LIST form CHANNEL ID

- (void)fetchSubscriptionListWithChannelIDByGoogleAPI {
    __block NSArray *blockResponseObject = nil;
    __block id blockError = nil;

    YoutubeResponseBlock completionBlock = ^(NSMutableArray *array, NSObject *respObject) {
        blockResponseObject = array;
    };
    ErrorResponseBlock errorBlock = ^(NSError *error) {
        blockError = error;
    };
    NSString *channelID = NPTEL_CHANNEL_ID;
    [[GYoutubeHelper getInstance] fetchSubscriptionsListWithChannelId:channelID CompletionHandler:completionBlock errorHandler:errorBlock];

    expect(blockError).will.beNil();
    expect(blockResponseObject).willNot.beNil();
}


- (void)fetchSubscriptionListWithChannelIDMAB {
    __block NSArray *blockResponseObject = nil;
    __block id blockError = nil;

    YoutubeResponseBlock completionBlock = ^(NSMutableArray *array, NSObject *respObject) {
        blockResponseObject = array;
    };
    ErrorResponseBlock errorBlock = ^(NSError *error) {
        blockError = error;
    };
    NSString *channelID = NPTEL_CHANNEL_ID;
    NSURLSessionDataTask *task = [[GYoutubeHelper getInstance] fetchMABSubscriptionsListWithChannelId:channelID CompletionHandler:completionBlock errorHandler:errorBlock];

    [task resume];

    expect(task.state).will.equal(NSURLSessionTaskStateCompleted);
    expect(blockError).will.beNil();
    expect(blockResponseObject).willNot.beNil();

//    expect(blockResponseObject.count).to.equal(2);
//    expect([blockResponseObject[0] class]).to.equal([MABYT3_Channel class]);
}
@end
