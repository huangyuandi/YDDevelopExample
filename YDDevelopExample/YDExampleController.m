//
//  YDExampleController.m
//  YDDevelopExample
//
//  Created by Onesoft on 2019/10/31.
//  Copyright © 2019年 Onesoft. All rights reserved.
//

#import "YDExampleController.h"

@interface YDExampleController ()<UITableViewDelegate , UITableViewDataSource>
/** tableView */
@property (nonatomic , weak) UITableView *tableView;
/** examples */
@property (nonatomic , strong) NSMutableArray *examples;
@end

@implementation YDExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    [self _setup];
    
    // 设置导航栏
    [self _setupNavigationItem];
    
    // 设置子控件
    [self _setupSubViews];
}
#pragma mark - 初始化
- (void)_setup
{
    self.view.backgroundColor = [UIColor whiteColor];
}
#pragma mark - 设置导航栏
- (void)_setupNavigationItem
{
    self.title = @"CoderMikeHe";
}
#pragma mark - 设置子控件
- (void)_setupSubViews
{
    // 创建tableView
    [self _setupTableView];
}

-(void)_setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.rowHeight = 55;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

-(NSMutableArray *)examples {
    if (_examples == nil) {
        _examples = [[NSMutableArray alloc] init];
    }
    return _examples;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
