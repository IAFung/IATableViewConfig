//
//  ViewController.m
//  IATableView
//
//  Created by feng on 2020/12/4.
//

#import "ViewController.h"
#import "SSTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:SSTableViewController.new animated:YES];
}

@end
