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

    [self fetchVideoListWithPlayListID];

    [self makeCollectionView];
    [self setUICollectionView:self.collectionView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGRect rect = self.view.bounds;
    self.collectionView.frame = rect;
}


#pragma mark -
#pragma mark make asCollectionView

- (void)setUICollectionView:(UICollectionView *)collectionView {
    [self.view addSubview:collectionView];

    collectionView.backgroundView = [ClientUIHelper mainUIBackgroundView:self.view.bounds];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.directionalLockEnabled = YES;
}


- (void)makeCollectionView {
    if(!self.collectionView) {
        self.layout = [[UICollectionViewFlowLayout alloc] init];

        self.layout.sectionInset = [self getUIEdgeInsetsForLayout];
//      self.layout.footerHeight = DEFAULT_LOADING_MORE_HEIGHT;
//      self.layout.minimumColumnSpacing = LAYOUT_MINIMUMCOLUMNSPACING;
        self.layout.minimumInteritemSpacing = 10;
//      self.layout.delegate = self;

        self.collectionView = [[ASCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        self.collectionView.asyncDataSource = self;
        self.collectionView.asyncDelegate = self;

        self.collectionView.allowsSelection = YES;
    }
}


- (int)getCurrentColumnCount:(UIInterfaceOrientation)orientation {
    return 3;
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
    ASCellNode *node = [self getCellNodeAtIndexPath:indexPath];

    return node;
}


- (ASCellNode *)getCellNodeAtIndexPath:(NSIndexPath *)indexPath {
    ASCellNode *node;

    node = [[YTAsCollectionChannelCellNode alloc]
            initWithCellNodeOfSize:[self cellSize]
                         withVideo:[self.videoList objectAtIndex:indexPath.row]];

    return node;
}


#pragma mark -
#pragma mark  UICollectionViewDelegate


//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//   NSString * debug = @"debug";
//}


#pragma mark - CHTCollectionViewDelegateWaterfallLayout


- (CGSize)collectionWaterfallView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self cellSize];
}


- (CGSize)cellSize {
    CGSize size;

    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    NSString *key = UIInterfaceOrientationIsPortrait(orientation) ? @"vertical" : @"horizontal";
    NSString *keyWidth = [NSString stringWithFormat:@"%@_width", key];
    NSString *keyHeight = [NSString stringWithFormat:@"%@_height", key];

    NSNumber *valueWidth = [self.cellSizeDictionary objectForKey:keyWidth];
    NSNumber *valueHeight = [self.cellSizeDictionary objectForKey:keyHeight];
    if(valueWidth && valueHeight) {
        size = CGSizeMake([valueWidth floatValue], [valueHeight floatValue]);
    } else {
        size = [self makeCellSize:orientation];
        NSNumber *aWidth = [NSNumber numberWithFloat:size.width];
        NSNumber *aHeight = [NSNumber numberWithFloat:size.height];
        [self.cellSizeDictionary setObject:aWidth forKey:keyWidth];
        [self.cellSizeDictionary setObject:aHeight forKey:keyHeight];
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