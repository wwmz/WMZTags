




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
    self.tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.estimatedSectionFooterHeight = 0.01;
    self.tabelView.estimatedSectionHeaderHeight = 0.01;
    self.tabelView.estimatedRowHeight = 100;
    [self.view addSubview:self.tabelView];
    
}

//tag的代理方法
- (void)updateCell:(id)cell data:(NSArray *)data{
    NSLog(@"刷新回调 %@",data);
    [UIView performWithoutAnimation:^{
        NSIndexPath *path = [self.tabelView indexPathForCell:(UITableViewCell*)cell];
        self.modelArr[path.row] = data;
        [self.tabelView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
    }];

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellName = self.cellNameArr[indexPath.row];
    WMZTagCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    Class classN = NSClassFromString(cellName);
    if(!cell){
        cell = [[classN alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName] ;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.modelArr[indexPath.row];
    cell.delegate = self;
    return cell;
}


- (NSMutableArray *)modelArr{
    if (!_modelArr) {
        _modelArr = [NSMutableArray new];
    }
    return _modelArr;
}

- (NSMutableArray*)getData{
    return [NSMutableArray arrayWithObjects:
            @[@"单纯显示的标签",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六",@"标签七"],
            @[@"单点的带图片标签",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六",@"标签七"],
            @[@"多点的带文字图片的标签(文字图片在左边)",@"cell标签1",@"cell标签2",@"cell标签3",@"cell标签4",@"cell标签5",@"cell标签6",@"cell标签7"],
            @[@"可删除的标签+可换行的标签",@"这是",@"一个具备",@"很多功能的标签",@"所有的功能都用链式编程",@"方便调用方便调用方便调用方便调用方便调用方便调用",@"欢迎下载使用欢迎下载使用欢迎下载使用欢迎下载使用欢迎下载使用",@"欢迎下载使用",@"感谢支持感谢支持感谢支持感谢支持感谢支持",@"感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持",@"感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持感谢支持"],
            @[@"size为mini带边框的标签,可添加标签",@"cell标签1111111",@"cell标签2222222",@"cell标签33",@"cell",@"cell标签5555555555555555555555555555555555555555",@"cell标签65555",@"cell标签77676886868686868688688686"],
            @[@"自定义添加标签事件",@"cell标签1111111",@"cell标签2222222",@"cell标签33",@"cell",@"cell标签5555555555555555555555555555555555555555",@"cell标签65555",@"cell标签77676886868686868688688686"],
            nil];
}

- (NSArray *)cellNameArr{
    if (!_cellNameArr) {
        _cellNameArr = @[@"WMZTagCell",@"tagOneCell",@"tagTwoCell",@"tagThreeCell",@"tagFourCell",@"tagFiveCell"];
//          _cellNameArr = @[@"tagOneCell",@"tagOneCell",@"tagOneCell",@"tagOneCell",@"tagOneCell",@"tagOneCell"];
    }
    return _cellNameArr;
}

@end
