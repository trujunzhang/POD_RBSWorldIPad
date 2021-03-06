//
// Created by djzhang on 1/18/15.
// Copyright (c) 2015 djzhang. All rights reserved.
//

#import "YoutubeVideoListViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <google-api-services-youtube/GYoutubeHelper.h>
#import "ASControlNode+Subclasses.h"
#import "ASDisplayNode+Subclasses.h"
#import "YTAsCollectionChannelCellNode.h"
#import "ClientUIHelper.h"
#import "YTAsRowNode.h"

#define LAYOUT_MINIMUMCOLUMNSPACING 10;

@interface YoutubeVideoListViewController ()<ASCollectionViewDataSource, ASCollectionViewDelegate>
@property (strong, nonatomic) ASCollectionView *collectionView;
@end


@implementation YoutubeVideoListViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Youtube channel nptelhrd Video List";

    self.numbersPerLineArray = [NSArray arrayWithObjects:@"3", @"4", nil];
    NSAssert(self.numbersPerLineArray, @"not found numbersPerLineArray!");

    self.activityIndicator.hidesWhenStopped = YES;
//    self.activityIndicator.backgroundColor = [UIColor blackColor];
    self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.activityIndicator startAnimating];

    [self fetchVideoListWithPlayListID];

    [self makeCollectionView];
    [self setUICollectionView:self.collectionView];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGRect rect = self.view.bounds;
    self.collectionView.frame = rect;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:NO];
}


#pragma mark -
#pragma mark make asCollectionView

- (void)setUICollectionView:(UICollectionView *)collectionView {
    [self.view addSubview:collectionView];
    [self.view sendSubviewToBack:collectionView];

    collectionView.backgroundView = [ClientUIHelper mainUIBackgroundView:self.view.bounds];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.directionalLockEnabled = YES;
}


- (void)makeCollectionView {
    if(!self.collectionView) {
        self.layout = [[UICollectionViewFlowLayout alloc] init];

        self.layout.sectionInset = [self getUIEdgeInsetsForLayout];
        self.layout.minimumInteritemSpacing = 1;

        self.collectionView = [[ASCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        self.collectionView.asyncDataSource = self;
        self.collectionView.asyncDelegate = self;

        self.collectionView.allowsSelection = YES;
    }
}


- (int)getCurrentColumnCount:(UIInterfaceOrientation)orientation {
    return [(self.numbersPerLineArray[UIInterfaceOrientationIsPortrait(orientation) ? 0 : 1]) intValue];
}


- (CGSize)makeCellSize:(UIInterfaceOrientation)orientation {
    int columnCount = [self getCurrentColumnCount:orientation];
    UICollectionViewLayout *layout = self.collectionView.collectionViewLayout;

    UIEdgeInsets uiEdgeInsets = [self getUIEdgeInsetsForLayout];

    CGFloat mini_num_column_space = LAYOUT_MINIMUMCOLUMNSPACING;
//   CGFloat aFloat = layout.collectionViewContentSize.width;
    CGFloat aFloat = self.view.frame.size.width;

    CGFloat usableSpace =
            (aFloat
                    - uiEdgeInsets.left - uiEdgeInsets.right
                    - ((columnCount - 1) * mini_num_column_space)
            );

    CGFloat cellLength = usableSpace / columnCount;

    CGFloat cellHeight = [YTAsRowNode collectionCellHeight];

    return CGSizeMake(cellLength, cellHeight);
}

- (UIEdgeInsets)getUIEdgeInsetsForLayout {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


#pragma mark - UICollectionViewDataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.videoList.count;
}


- (ASCellNode *)collectionView:(ASCollectionView *)collectionView nodeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [[YTAsCollectionChannelCellNode alloc]
            initWithCellNodeOfSize:[self cellSize]
                         withVideo:[self.videoList objectAtIndex:indexPath.row]];
}


#pragma mark -
#pragma mark  UICollectionViewDelegate


- (CGSize)cellSize {
    CGSize size;

    NSString *key = UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? @"vertical" : @"horizontal";
    NSString *keyWidth = [NSString stringWithFormat:@"%@_width", key];
    NSString *keyHeight = [NSString stringWithFormat:@"%@_height", key];

    NSNumber *valueWidth = [YoutubeParser checkAndAppendThumbnailWithChannelId:keyWidth];
    NSNumber *valueHeight = [YoutubeParser checkAndAppendThumbnailWithChannelId:keyHeight];
    if(valueWidth && valueHeight) {
        size = CGSizeMake([valueWidth floatValue], [valueHeight floatValue]);
    } else {
        size = [self makeCellSize:[UIApplication sharedApplication].statusBarOrientation];
        [YoutubeParser cacheWithKey:keyWidth withValue:[NSNumber numberWithFloat:size.width]];
        [YoutubeParser cacheWithKey:keyHeight withValue:[NSNumber numberWithFloat:size.height]];
    }

    return size;
}

#pragma mark -
#pragma mark

- (void)fetchVideoListWithPlayListID {
    YoutubeResponseBlock completionBlock = ^(NSMutableArray *array, NSObject *respObject) {
        NSString *debug = @"debug";
        self.videoList = [array mutableCopy];
        [self.collectionView reloadData];
        [self.activityIndicator stopAnimating];
    };
    ErrorResponseBlock errorBlock = ^(NSError *error) {
        NSString *debug = @"debug";
    };
    NSString *playlistId = @
//            "PLbMVogVj5nJSC_ZwkvUv15g6lYrNNMI9M,"//
//            "PLbMVogVj5nJSEQYH2dVtcXN9I4n8hF0VY"
//            "PLbMVogVj5nJQNzJT6sYZpB7H1G6WF0FZ4"
            "PLbMVogVj5nJSl_2XmFjuRmvuAgCOZXUjv";
    NSURLSessionDataTask *task = [[GYoutubeHelper getInstance] fetchVideoListWithPlayListID:playlistId completionHandler:completionBlock errorHandler:errorBlock];
}


@end