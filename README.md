# IATableViewConfig

使用方法:

新建控制器,继承于**IATableViewController**

往dataList里塞入自己的数据

```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    [M80FeedMocker fetchFeeds:100 completion:^(NSArray * _Nonnull feeds) {
       [self.dataList addObjectsFromArray: [feeds ia_map:^id _Nonnull(id  _Nonnull object) {
            return @[
                [IACellConfig configWithClass:@"M80FeedAvatarCell" isNib:YES model:object],
              //内置空白cell,可用于间隔,分割线
                [IACellConfig noNibConfigWithClass:@"IABaseTableViewCell" model:[IABlankModel modelWithColor:UIColor.redColor height:10 leftPadding:10 rightPadding:0]],
                [IACellConfig configWithClass:@"M80FeedTextCell" isNib:NO model:object],
                [IACellConfig noNibConfigWithClass:@"IABaseTableViewCell" model:[IABlankModel modelWithColor:UIColor.lightGrayColor height:1 leftPadding:15 rightPadding:15]],
                [IACellConfig configWithClass:@"StackTableViewCell" isNib:YES model:object],
                [IACellConfig configWithClass:@"M80FeedImageCell" isNib:NO model:object],
                [IACellConfig configWithClass:@"M80FeedToolbarViewCell" isNib:YES model:object],
                [IACellConfig noNibConfigWithClass:@"IABaseTableViewCell" model:[IABlankModel modelWithColor:UIColor.blueColor height:50]],
            ];
        }]];
        [self.tableView reloadData];
    }];
}
```

tableView cell点击事件响应:

```objective-c
- (void)didSelectedCell:(UITableViewCell *)cell
              indexPath:(NSIndexPath *)indexPath
                 config:(IACellConfig *)config {
    NSLog(@"%@",config.cellClass);
}
```



返回高度三种方式:

1. cellHeightByConfig

   ```objective-c
   - (CGFloat)cellHeightByConfig:(IACellConfig *)config{
       return 50;
   }
   ```

2. autoCalculateHeight返回YES. 这种情况需要添加好约束,且约束高度要指定出来,

   ```objective-c
   - (BOOL)autoCalculateHeight {
       return YES;
   }
   ```

3. autoCalculateHeight返回YES. 约束计算为0会走sizeThatFits方法

   ```objective-c
   - (BOOL)autoCalculateHeight {
       return YES;
   }
   - (CGSize)sizeThatFits:(CGSize)size {
       return CGSizeMake(UIScreen.mainScreen.bounds.size.width - 30, 110);
   }
   ```

点击展开关闭更换高度时,切换当前cellConfig的**changedHeight**属性

```objective-c
@implementation M80FeedAvatarCell {
    IACellConfig *_config;
}
- (CGFloat)cellHeightByConfig:(IACellConfig *)config{
    if (config.changedHeight) {
        return 70;
    }
    return 50;
}
- (void)onTap:(id)sender
{
    _config.changedHeight = !_config.changedHeight;
  //刷新当前cell的高度
    [IATableViewReloader reloadChangedHeightCell:_config];
}
- (void)setCellConfig:(IACellConfig *)config {
    _config = config;
}
```

