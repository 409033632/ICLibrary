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
    
#pragma mark - GET 请求
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://61.155.169.168:8088/r/c/find?cnt.app=fuchin&cnt.name=fuchin.consumable"]];
//    
//    //get
//    AFJSONRequestOperation *operation = [AFJSONRequestOperation 
//                                         JSONRequestOperationWithRequest:request 
//                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//                                             NSDictionary *dic = [NSDictionary dictionaryWithDictionary:JSON];
//                                             NSLog(@"%@",[[dic objectForKey:@"data"] objectAtIndex:0]);
//                                             
//    } 
//                                         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
//                                         
//                                         }];
//    [operation start];
    

    
    
#pragma mark - POST 请求(传输的参数为JSON对象)
    /*
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://42.121.110.179:8080/ccs/servlet/ACSClientHttp"]];
	NSMutableData *postBody = [NSMutableData data];
    NSString *postString = [NSString stringWithFormat:@"{\"appcode\":\"CCSPLAT\",\"params\":[{\"imei\":\"001\",\"imsi\":\"002\",\"os\":\"iphone\",\"param\":[{\"username\":\"015\",\"userpass\":\"111111\"}]}],\"methodName\":\"userLogin\",\"beanName\":\"ccsuserhttpservice\"}"];
 
    
    [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    [postRequest setHTTPBody:postBody];

    [postRequest setValue:@"application/json; charset=\"UTF-8\"; text/html" forHTTPHeaderField:@"Content-Type"];  
	[postRequest setHTTPMethod:@"POST"];
    
    AFHTTPRequestOperation *httpOpertation = [[AFHTTPRequestOperation alloc] initWithRequest:postRequest];
    [httpOpertation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSLog(@"%@",(NSString *)responseObject);
        NSLog(@"%@",operation.responseString);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"%@",error);
    }];
    
    [httpOpertation start];
    */
    

    
    
#pragma mark - POST 请求（键值对参数形式）
    
    /*
    NSURL *urlString = [NSURL URLWithString:@"http://42.121.110.179:8080/ccs/servlet/ACSClientHttp"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:urlString];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"015",@"username",@"111111",@"password", nil];
    
    
    
    [httpClient postPath:nil parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
    
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
    
    
    }];
    */

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
