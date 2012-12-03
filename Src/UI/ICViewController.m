//
//  ICViewController.m
//  iChanceSample
//
//  Created by Fox on 12-12-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ICViewController.h"

#define MAXCONCURRENTOPERATIONCOUNT         3
#define TIME_OUT                            10

@interface ICViewController ()

@end

@implementation ICViewController

#pragma mark - Memory mamger
-(void)dealloc
{
    [_operationQueue release];
    [super dealloc];
}


#pragma mark - UIViewController life cycle
-(id)init
{
    self = [super init];
    if (self) {
        //初始化
        _userDefault = [NSUserDefaults standardUserDefaults];
        
        _operationQueue = [[NSOperationQueue alloc] init];
        [_operationQueue setMaxConcurrentOperationCount:MAXCONCURRENTOPERATIONCOUNT];//同时最大连接数
    }
    return self;
}



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
	// Do any additional setup after loading the view, typically from a nib.
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

#pragma mark - GET请求
- (void)getAsynchronousRequest:(id)delegate 
                    requestUrl:(NSString *)requestUrl 
            didFinishedRequest:(getFinished_block)didFinishedRequest  
              didFailedRequest:(getFailed_block)didFailedRequest
{
    
    NSURL *url = [NSURL URLWithString:requestUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://61.155.169.168:8088/r/c/find?cnt.app=fuchin&cnt.name=fuchin.consumable"]];
    
    
    //get
    AFJSONRequestOperation *operation = [AFJSONRequestOperation 
                                         JSONRequestOperationWithRequest:request 
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//                                             NSDictionary *dic = [NSDictionary dictionaryWithDictionary:JSON];
//                                             NSLog(@"%@",[[dic objectForKey:@"data"] objectAtIndex:0]);
                                             didFinishedRequest(request,response,JSON);
                                         } 
                                         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
                                             didFailedRequest(request, response, error, JSON);
                                         }];
//    [operation start];
    [_operationQueue addOperation:operation];

}

#pragma mark - Post 请求（键值对形式）
- (void)postAsynchronousRequest:(id)delegate 
                         params:(NSDictionary *)params
             didFinishedRequest:(postFinished_block)didFinishedRequest  
               didFailedRequest:(postFailed_block)didFailedRequest
{
    NSURL *urlString = [NSURL URLWithString:@"http://42.121.110.179:8080/ccs/servlet/ACSClientHttp"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:urlString];
    NSDictionary *myparams = [NSDictionary dictionaryWithObjectsAndKeys:@"015",@"username",@"111111",@"password", nil];
    
    
    
    [httpClient postPath:nil parameters:myparams success:^(AFHTTPRequestOperation *operation, id responseObject){
        didFinishedRequest(operation,responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        didFailedRequest(operation, error);
        
    }];

}

#pragma mark - Post 请求（JSON参数形式）

- (void)postJSONAsynchronousRequest:(id)delegate 
                             params:(NSDictionary *)params
                 didFinishedRequest:(postFinished_block)didFinishedRequest  
                   didFailedRequest:(postFailed_block)didFailedRequest
{
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
        didFinishedRequest(operation, responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        didFailedRequest(operation, error);
    }];
    
//    [httpOpertation start];
    [_operationQueue addOperation:httpOpertation];
}


@end
