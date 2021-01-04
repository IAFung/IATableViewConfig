//  QuarkTableViewController.m
//  empty
//
//  Created by fun on 2018/9/20.
//  Copyright © 2018年 fun. All rights reserved.
//

#import "IATableViewController.h"

@interface IATableViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation IATableViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataList = @[].mutableCopy;
    self.cellManager = [IACellManager new];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.cellManager.tableView = self.tableView;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IACellConfig *dto = self.dataList[indexPath.row];
    if (self.is2D) {
        dto = self.dataList[indexPath.section][indexPath.row];
    }
    return [_cellManager registerCellByConfig:dto];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.is2D) {
        return self.dataList.count;
    } else {
        return 1;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.is2D) {
        return [self.dataList[section] count];
    }
    return self.dataList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    IACellConfig *dto = self.dataList[indexPath.row];
    if (self.is2D) {
        dto = self.dataList[indexPath.section][indexPath.row];
    }
    return [self.cellManager cellHeightByConfig:dto];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    IACellConfig *dto = self.dataList[indexPath.row];
    if (self.is2D) {
        dto = self.dataList[indexPath.section][indexPath.row];
    }
    [self didSelectedCell:[tableView cellForRowAtIndexPath:indexPath] indexPath:indexPath config:dto];
}
- (void)didSelectedCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath config:(IACellConfig *)config {
    
}

- (BOOL)is2D {
    return self.dataList.count > 0 && [self.dataList.firstObject isKindOfClass:NSArray.class];
}

@end
