//
//  ICUIViewController.h
//  iChanceSample
//
//  Created by Fox on 12-12-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ICViewController.h"

@interface ICUIViewController : ICViewController <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
    NSArray *_dataSource;
}
@end
