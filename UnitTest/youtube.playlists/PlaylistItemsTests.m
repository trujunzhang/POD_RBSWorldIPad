//
//  PlaylistItemsTests.m
//  RBSWorldIPad
//
//  Created by djzhang on 1/18/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GYoutubeHelper.h"
#import "AppTestCase.h"
#import "YoutubeParser.h"

//playlistId
//:PLbMVogVj5nJQmNqgs7GLBE-HhMi0GQOPW-(https://www.youtube.com/watch?v=GE1YyJ4A_7w&list=PLbMVogVj5nJQmNqgs7GLBE-HhMi0GQOPW)

@interface PlaylistItemsTests : AppTestCase

@end

@implementation PlaylistItemsTests


- (void)testFetchVideoListWithPlayListID {
    [self fetchVideoListWithPlayListID];
}

#pragma mark -
#pragma mark fetching CHANNEL LIST

- (void)fetchVideoListWithPlayListID {
    __block NSArray *blockResponseObject = nil;
    __block id blockError = nil;

    YoutubeResponseBlock completionBlock = ^(NSMutableArray *array, NSObject *respObject) {
        blockResponseObject = array;
        id object = array[0];
        NSString *itemThumbnails = [YoutubeParser getPlayListItemThumbnails:object];
        NSString *itemTitle = [YoutubeParser getPlayListItemTitle:object];
        NSString *debug = @"debug";
    };
    ErrorResponseBlock errorBlock = ^(NSError *error) {
        blockError = error;
    };
    NSString *playlistId = @"PLbMVogVj5nJQmNqgs7GLBE-HhMi0GQOPW";
    NSURLSessionDataTask *task = [[GYoutubeHelper getInstance] fetchVideoListWithPlayListID:playlistId completionHandler:completionBlock errorHandler:errorBlock];

    [task resume];

    expect(task.state).will.equal(NSURLSessionTaskStateCompleted);
    expect(blockError).will.beNil();
    expect(blockResponseObject).willNot.beNil();

    expect([blockResponseObject[0] class]).to.equal([MABYT3_PlayListItem class]);
}

@end
