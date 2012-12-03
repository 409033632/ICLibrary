//
//  ICViewController.h
//  iChanceSample
//
//  Created by Fox on 12-12-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//  super view
 
#import <UIKit/UIKit.h>
#import "AFNetworking.h"


typedef void(^getFinished_block)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON);
typedef void(^getFailed_block)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON);
typedef void(^postFinished_block)(AFHTTPRequestOperation *operation, id responseObject);
typedef void(^postFailed_block)(AFHTTPRequestOperation *operation, NSError *error);

@interface ICViewController : UIViewController
{
    NSOperationQueue *_operationQueue;                  /** < 操作队列*/
    NSUserDefaults *_userDefault;                       /** < 用于数据的缓存*/
}

#pragma mark - Get 请求

/**
 * @brief                       GET异步请求
 * @param delegate              代理
 * @param didFinishedRequest    完成块
 * @param didFailedRequest      失败块
 */
- (void)getAsynchronousRequest:(id)delegate 
                    requestUrl:(NSString *)requestUrl 
            didFinishedRequest:(getFinished_block)didFinishedRequest  
              didFailedRequest:(getFailed_block)didFailedRequest;

#pragma mark - Post 请求（键值对形式）
/**
 * @brief                       POST异步请求,以键值对的参数形式
 * @param delegate              代理
 * @param didFinishedRequest    完成块
 * @param didFailedRequest      失败块
 */
- (void)postAsynchronousRequest:(id)delegate 
                         params:(NSDictionary *)params
             didFinishedRequest:(postFinished_block)didFinishedRequest  
               didFailedRequest:(postFailed_block)didFailedRequest;



#pragma mark - Post 请求（JSON参数形式）
/**
 * @brief                       GET异步请求（以JSON参数形式）
 * @param delegate              代理
 * @param didFinishedRequest    完成块
 * @param didFailedRequest      失败块
 */
- (void)postJSONAsynchronousRequest:(id)delegate 
                             params:(NSDictionary *)params
                 didFinishedRequest:(postFinished_block)didFinishedRequest  
                   didFailedRequest:(postFailed_block)didFailedRequest;


@end
