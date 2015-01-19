//
// Created by djzhang on 1/18/15.
// Copyright (c) 2015 djzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YoutubeVideoListViewController : UIViewController

@property (nonatomic, strong) NSArray *numbersPerLineArray;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@property (nonatomic, strong) NSMutableDictionary *cellSizeDictionary;

@property (nonatomic, strong) NSMutableArray *videoList;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;



@end