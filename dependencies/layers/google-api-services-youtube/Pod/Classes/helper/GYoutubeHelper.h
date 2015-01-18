//
//  Search.h
//  IOSTemplate
//
//  Created by djzhang on 9/25/14.
//  Copyright (c) 2014 djzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <google-api-services-youtube/GYoutubeHelper.h>


#import "YoutubeConstants.h"
#import "GYoutubeRequestInfo.h"
#import "GYoutubeHelper.h"


@class GYoutubeAuthUser;
@class YoutubeAuthInfo;
@class GYoutubeRequestInfo;

typedef void (^YoutubeResponseBlock)(NSArray *array, NSObject *respObject);

typedef void (^ErrorResponseBlock)(NSError *error);


@protocol GYoutubeHelperDelegate<NSObject>

@optional

- (void)callbackAfterFetchingAuthorSubscriptionListCompletion:(NSArray *)subscriptionList;

- (void)callbackUpdateYoutubeChannelCompletion:(YoutubeAuthInfo *)info;

@end


@interface GYoutubeHelper : NSObject {

}
// Accessor for the app's single instance of the service object.
@property (nonatomic, strong) YTServiceYouTube *youTubeService;
@property (nonatomic, strong) GYoutubeAuthUser *youtubeAuthUser;
@property (nonatomic) BOOL isSignedIn;

+ (GYoutubeHelper *)getInstance;


- (void)searchByQueryWithRequestInfo:(GYoutubeRequestInfo *)info completionHandler:(YoutubeResponseBlock)handler errorHandler:(ErrorResponseBlock)handler1;

- (void)signingOut;


- (NSURLSessionDataTask *)fetchChannelBrandingWithChannelId:(NSString *)channelId completion:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)errorBlock;

- (NSURLSessionDataTask *)fetchChannelForPageView:(NSString *)channelId completion:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)errorBlock;

- (NSURLSessionDataTask *)fetchChannelThumbnailsWithChannelId:(NSString *)channelId completion:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)errorBlock;

- (void)fetchPlaylistItemsListWithTagType:(YTPlaylistItemsType)tagType completion:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)errorBlock;

- (void)fetchActivityListWithRequestInfo:(GYoutubeRequestInfo *)info CompletionHandler:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)errorHandler;

- (void)fetchSuggestionListWithRequestInfo:(GYoutubeRequestInfo *)info CompletionHandler:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)errorHandler;

- (void)cancelAutoCompleteSuggestionTask;

- (void)autoCompleteSuggestions:(NSString *)searchWish CompletionHandler:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)errorHandler;


- (void)fetchPlaylistItemsListWithPlaylists:(GTLYouTubeChannelContentDetailsRelatedPlaylists *)playlists tagType:(YTPlaylistItemsType)tagType completion:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)errorBlock;

- (YTOAuth2Authentication *)getAuthorizer;

- (void)saveAuthorizeAndFetchUserInfo:(YTOAuth2Authentication *)authentication;

- (GTMOAuth2ViewControllerTouch *)getYoutubeOAuth2ViewControllerTouchWithTouchDelegate:(id)touchDelegate leftBarDelegate:(id)leftBarDelegate cancelAction:(SEL)cancelAction;

@property (nonatomic, weak) id<GYoutubeHelperDelegate> delegate;

- (void)fetchPlayListFromChannelWithRequestInfo:(GYoutubeRequestInfo *)info completionHandler:(YoutubeResponseBlock)completeBlock errorHandler:(ErrorResponseBlock)errorHandler;

- (void)fetchPlaylistItemsListWithRequestInfo:(GYoutubeRequestInfo *)info completion:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)handler;

#pragma mark -
#pragma mark "playlistItems" methods

- (NSURLSessionDataTask *)fetchVideoListWithPlayListID:(NSString *)playlistId completionHandler:(YoutubeResponseBlock)completionBlock errorHandler:(ErrorResponseBlock)errorBlock;

#pragma mark -
#pragma mark "channels" methods


- (NSURLSessionDataTask *)fetchChannelListWithChannelIDs:(NSString *)channelIDs completion:(YoutubeResponseBlock)completionBlock errorHandler:(ErrorResponseBlock)errorBlock;

- (void)fetchChannelListWithIdentifier:(NSString *)channelId completion:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)errorBlock;

#pragma mark -
#pragma mark "subscriptions" methods

- (NSURLSessionDataTask *)fetchMABSubscriptionsListWithChannelId:(NSString *)channelId CompletionHandler:(YoutubeResponseBlock)completionBlock errorHandler:(ErrorResponseBlock)errorBlock;

- (void)fetchSubscriptionsListWithChannelId:(NSString *)channelId CompletionHandler:(YoutubeResponseBlock)completion errorHandler:(ErrorResponseBlock)errorBlock;


@end
