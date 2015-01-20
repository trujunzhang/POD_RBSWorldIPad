//
// Created by djzhang on 12/10/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "YTAsFirstVideoRowNode.h"

@interface YTAsFirstVideoRowNode () {
    ASNetworkImageNode *_videoCoverThumbnailsNode;
}

@end


@implementation YTAsFirstVideoRowNode {

}


- (void)makeRowNode {
    _videoCoverThumbnailsNode = [ASCacheNetworkImageNode nodeWithImageUrl:[YoutubeParser getPlayListItemThumbnails:self.nodeInfo]];
    _videoCoverThumbnailsNode.contentMode = UIViewContentModeScaleToFill;

    [self addSubnode:_videoCoverThumbnailsNode];

    [self setNodeTappedEvent];

}


- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
    return self.cellRect.size;
}


- (void)layout {
    _videoCoverThumbnailsNode.frame = self.cellRect;

}


#pragma mark -
#pragma mark node tapped event


- (void)setNodeTappedEvent {
    // configure the button
    _videoCoverThumbnailsNode.userInteractionEnabled = YES; // opt into touch handling
    [_videoCoverThumbnailsNode addTarget:self
                                  action:@selector(buttonTapped:)
                        forControlEvents:ASControlNodeEventTouchUpInside];
}


- (void)buttonTapped:(id)buttonTapped {

}

@end