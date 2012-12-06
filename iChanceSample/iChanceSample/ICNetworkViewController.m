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
#import "CommonHelper.h"
#import "XMLReader.h"


#import <objc/runtime.h>
#import <objc/message.h>

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

    self.title = NSLocalizedString(@"HelloKey", @"12121");   

    //Http get
//    NSString *inputString = [NSString stringWithFormat:@"http://222.73.126.185:81/interface/Mobile/MobileService.asmx/ProductList?input=%@",[CommonHelper userRegisterWithUserName:@"Fox" password:@"123456" mobile:@"13758125066"]];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:inputString]];
//    AFXMLRequestOperation *operation = [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser) {
//        XMLParser.delegate = self;
//        [XMLParser parse];
//        NSLog(@"sucess");
//        
//    } failure:nil];
//    [operation start];
    
    NSString *testXMLString = @"<items><item id=\"0001\" type=\"donut\"><name>Cake</name><ppu>0.55</ppu><batters><batter id=\"1001\">Regular</batter><batter id=\"1002\">Chocolate</batter><batter id=\"1003\">Blueberry</batter></batters><topping id=\"5001\">None</topping><topping id=\"5002\">Glazed</topping><topping id=\"5005\">Sugar</topping></item></items>";
    // Parse the XML into a dictionary
    NSError *parseError = nil;
    NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLString:testXMLString error:&parseError];
    
    // Print the dictionary
    NSLog(@"%@", xmlDictionary);
    
    
    
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
