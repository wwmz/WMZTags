




//
//  tagUseTableViewVC.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagUseTableViewVC.h"
#import "ViewController.h"
#import "WMZTagCell.h"
@interface tagUseTableViewVC ()<UITableViewDelegate,UITableViewDataSource,WMZTagDelegate>
@property(nonatomic,strong)NSMutableArray *modelArr;
@property(nonatomic,strong)NSMutableArray *titleArr;
@property(nonatomic,strong)NSArray *cellNameArr;
@property(nonatomic,strong)UITableView *tabelView;
@end

@implementation tagUseTableViewVC


- (void)push{
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"cell使用场景";
    
    UIButton *leftbutton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [leftbutton setTitle:@"View使用场景" forState:UIControlStateNormal];
    [leftbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*item = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    self.navigationItem.rightBarButtonItem = item;
    
    self.modelArr = [self getData];
    self.tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.estimatedSectionFooterHeight = 0.01;
    self.tabelView.estimatedSectionHeaderHeight = 0.01;
    self.tabelView.estimatedRowHeight = 100;
    [self.view addSubview:self.tabelView];
    
}

//tag的代理方法 支持tableview刷新
- (void)updateCell:(id)cell data:(NSArray *)data{
    NSLog(@"刷新回调 %@",data);
    [UIView performWithoutAnimation:^{
        NSIndexPath *path = [self.tabelView indexPathForCell:(UITableViewCell*)cell];
        self.modelArr[path.section] = data;
        [self.tabelView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
    }];

}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.titleArr[section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.modelArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellName = self.cellNameArr[indexPath.section];
    WMZTagCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%ld-%ld",indexPath.section,indexPath.row]];
    Class classN = NSClassFromString(cellName);
    if(!cell){
        cell = [[classN alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ld-%ld",indexPath.section,indexPath.row]] ;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.modelArr[indexPath.section];
    cell.delegate = self;
    return cell;
}



- (NSMutableArray *)modelArr{
    if (!_modelArr) {
        _modelArr = [NSMutableArray new];
    }
    return _modelArr;
}

- (NSArray*)titleArr{
    return @[
             @"单纯显示的标签",@"单选带勾选图片的标签,默认选中第3个",@"多点的带文字图片的标签(文字图片在左边)",@"可删除的标签+可换行的标签",
             @"size为mini的标签,可增加标签",@"自定义添加标签事件",
             ];
}

- (NSMutableArray*)getData{
    return [NSMutableArray arrayWithObjects:
            @[@"标签一",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六",@"标签七"],
            @[@"标签一",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六",@"标签七"],
            @[@"标签一",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六",@"标签七"],
            @[@"标签一",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六",@"标签七"],
            @[@"标签一",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六",@"标签七"],
            @[@"标签一",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六",@"标签七"],
            nil];
}

- (NSArray *)cellNameArr{
    if (!_cellNameArr) {
        _cellNameArr = @[@"tagZeroCell",@"tagOneCell",@"tagTwoCell",@"tagThreeCell",@"tagFourCell",@"tagFiveCell"];
    }
    return _cellNameArr;
}

@end
