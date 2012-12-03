//
//  PullingRefreshTableView.h
//  Fuchin
//
//  Created by Fox on 12-12-1.
//  Copyright (c) 2012年 C1618. All rights reserved.
//

/*  eg:
 _tableView = [[PullingRefreshTableView alloc] initWithFrame:frame pullingDelegate:aPullingDelegate];
 [self.view addSubview:_tableView];
 _tableView.autoScrollToNextPage = NO;
 _tableView.delegate = self;
 _tableView.dataSource = self;
 */



#import <UIKit/UIKit.h>

typedef enum {
    kPRStateNormal = 0,
    kPRStatePulling = 1,
    kPRStateLoading = 2,
    kPRStateHitTheEnd = 3
} PRStatue;

@interface LoadingView : UIView
{
    UILabel *_stateLabel;                       /** < 状态标签*/
    UILabel *_dateLabel;                        /** < 时间标签*/
    UIImageView *_arrowView;                    /** < 箭头视图*/
    UIActivityIndicatorView *_activityView;     /** < 加载中*/
    CALayer *_arrow;                            /** < 箭头层*/
    
    BOOL _loading;                              /** < 是否加载*/
}

@property (nonatomic, getter = isLoading) BOOL loading;
@property (nonatomic, getter = isAtTop) BOOL atTop;
@property (nonatomic) PRStatue state;

- (id)initWithFrame:(CGRect)frame atTop:(BOOL)top;

- (void)updateRefreshDate:(NSDate *)date;

@end

@protocol PullingRefreshTableViewDelegate;

@interface PullingRefreshTableView : UITableView <UIScrollViewDelegate>
{
    LoadingView *_headerView;               /** < 表格头部视图*/
    LoadingView *_footerView;               /** < 表格根部视图*/
    
    UILabel *_msgLabel;                     /** < 消息标签*/
    BOOL _loading;                          /** < 是否在加载中*/
    BOOL _isFooterInAction;                 /** < 是否加载更多中*/
    NSInteger _bottomRow;                   /** < 底部的行数*/
}

@property (nonatomic, assign) id<PullingRefreshTableViewDelegate> pullingDelegate;
@property (nonatomic) BOOL autoScrollToNextPage;
@property (nonatomic) BOOL reachedTheEnd;
@property (nonatomic,getter = isHeaderOnly) BOOL headerOnly;
@property (nonatomic,getter = isNeedHeader) BOOL needHeader;

/**
 * @brief   初始化
 */
- (id)initWithFrame:(CGRect)frame pullingDelegate:(id<PullingRefreshTableViewDelegate>)aPullingDelegate;

/**
 * @brief   表格滑动
 */
- (void)tableViewDidScroll:(UIScrollView *)scrollView;

/**
 * @brief   表格停止拖动
 */
- (void)tableViewDidEndDragging:(UIScrollView *)scrollView;

/**
 * @brief   表格结束加载
 */
- (void)tableViewDidFinishedLoading;

/**
 * @brief   表格结束加载并显示相应的信息
 */
- (void)tableViewDidFinishedLoadingWithMessage:(NSString *)msg;

/**
 * @brief   进行刷新
 */
- (void)launchRefreshing;

@end


@protocol PullingRefreshTableViewDelegate <NSObject>

@required
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView;

@optional
//Implement this method if headerOnly is false
- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView;

//Implement the follows to set date you want,Or Ignore them to use current date 
- (NSDate *)pullingTableViewRefreshingFinishedDate;
- (NSDate *)pullingTableViewLoadingFinishedDate;
@end




