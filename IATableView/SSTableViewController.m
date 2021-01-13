//
//  TableViewController.m
//  IATableView
//
//  Created by feng on 2020/12/5.
//

#import "SSTableViewController.h"
#import "M80FeedMocker.h"
#import "NSArray+IAAddition.h"
#import "IABaseTableViewCell.h"
#import <IATableViewConfig/IATableViewConfig.h>
#import "IACellConfig+Line.h"
@implementation SSTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [M80FeedMocker fetchFeeds:100 completion:^(NSArray * _Nonnull feeds) {
       [self.dataList addObjectsFromArray: [feeds ia_map:^id _Nonnull(id  _Nonnull object) {
            return @[
                [IACellConfig configWithClass:@"M80FeedAvatarCell" isNib:YES model:object],
                [IACellConfig lineWithColor:UIColor.redColor height:10 leftPadding:10 rightPadding:0],
                [IACellConfig configWithClass:@"M80FeedTextCell" isNib:NO model:object],
                [IACellConfig lineWithColor:UIColor.lightGrayColor leftPadding:15 rightPadding:15],
                [IACellConfig lineWithHeight:100],
                [IACellConfig configWithClass:@"StackTableViewCell" isNib:YES model:object],
                [IACellConfig lineWithColor:UIColor.cyanColor],
                [IACellConfig configWithClass:@"M80FeedImageCell" isNib:NO model:object],
                [IACellConfig configWithClass:@"M80FeedToolbarViewCell" isNib:YES model:object],
                [IACellConfig lineWithColor:UIColor.blueColor height:50],
            ];
        }]];
        [self.tableView reloadData];
    }];
}
- (void)didSelectedCell:(UITableViewCell *)cell
              indexPath:(NSIndexPath *)indexPath
                 config:(IACellConfig *)config {
    NSLog(@"%@",config.cellClass);
}
- (void)dealloc
{
    NSLog(@"dealloc");
}
@end
