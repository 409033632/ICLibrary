//
//  ICNetworkViewController.m
//  iChanceSample
//
//  Created by Fox on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ICNetworkViewController.h"
#import "AFHTTPClient.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface ICNetworkViewController ()

@end

@implementation ICNetworkViewController

#pragma mark - Memory manager
-(void)dealloc
{
    [super dealloc];
}

#pragma mark - UIViewController life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"ICNetworkViewController";
    

    
    
#pragma mark - POST 请求(传输的参数为JSON对象)
    

    
    

    
    
#pragma mark - POST 请求（键值对参数形式）
    
    

    

#pragma mark - 下载

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
