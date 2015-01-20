//
// Created by djzhang on 1/19/15.
// Copyright (c) 2015 djzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKYouTubeVideo.h"


@interface JZYoutubeVideo : YKYouTubeVideo

- (instancetype)initWithVideoId:(NSString *)videoId;

- (void)playAuto:(YKQualityOptions)quality;

- (void)playInView:(UIView *)pView withQualityOptions:(YKQualityOptions)quality;

- (void)stop;

@end