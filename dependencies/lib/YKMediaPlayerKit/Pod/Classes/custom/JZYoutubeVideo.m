//
// Created by djzhang on 1/19/15.
// Copyright (c) 2015 djzhang. All rights reserved.
//

#import "JZYoutubeVideo.h"


@implementation JZYoutubeVideo {

}


- (instancetype)initWithVideoId:(NSString *)videoId {
    self = [super init];
    if(self) {
        self.contentURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", videoId]];
    }
    return self;
}

- (void)playAuto:(YKQualityOptions)quality {
    [self play:quality];
    [self.player.moviePlayer setShouldAutoplay:YES];
}

- (void)playInView:(UIView *)pView withQualityOptions:(YKQualityOptions)quality {
    if(!self.player) [self movieViewController:quality];

    self.player.moviePlayer.view.frame = pView.bounds;// used
    self.player.moviePlayer.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    [pView addSubview:self.player.moviePlayer.view];
    [self.player.moviePlayer play];
}


- (void)stop {
    if(!self.player)
        [self.player.moviePlayer stop];
}

@end