//  ViewController.h
//  empty
//
//  Created by fun on 2018/9/20.
//  Copyright © 2018年 fun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACellManager.h"
#import "IACellConfig.h"
#import "IACellConfig.h"
@interface IATableViewController : UIViewController
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataList;
@property (nonatomic, strong) IACellManager *cellManager;
- (void)didSelectedCell:(UITableViewCell *)cell
              indexPath:(NSIndexPath *)indexPath
                 config:(IACellConfig *)config;
@end

