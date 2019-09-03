//
//  ViewController.m
//  WMZTags
//
//  Created by wmz on 2019/5/23.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "ViewController.h"
#import "WMZTags.h"
#import "WMZTagCell.h"
@interface ViewController ()
@property(nonatomic,strong)WMZTags *tag2;
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"view使用场景";
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView = [UIScrollView new];
    self.scrollView.frame = self.view.bounds;
    [self.view addSubview:self.scrollView];
     __weak typeof(self) weakSelf = self;
    
    
    //frame使用
    WMZTagParam *model = TagParam()
    .wDataSet(@[@"frame布局",@"这是",@"一个具备",@"很多功能的标签",@"所有的功能都用链式编程",@"方便调用方便调用方便调用方便调用方便调用方便调用",@"欢迎下载使用欢迎下载使用欢迎下载使用欢迎下载使用欢迎下载使用",@"欢迎下载使用",@"感谢支持感谢支持感谢支持感谢支持感谢支持"])
    .wFrameSet(CGRectMake(10, 10, 310, 0))
    .wClosableSet(YES)
    .wTagAlignSet(TagAlignRight)
    ;
    WMZTags *tag1 = [[WMZTags alloc]initConfigureWithModel:model  withView:self.scrollView];
   
    
//  maronry使用
    WMZTagParam *model1 =
    TagParam()
    .wDataSet(@[@"标签一",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六",@"标签七",@"标签八",@"标签九"])
    .imageNameSet(@"notCheck")
    .selectImageNameSet(@"check")
    .wHitSet(YES)
    .wRadiusSet(10)
    .wBoderWidthSet(1)
    .wBoderColorSet([UIColor cyanColor])
    .textImageNameSet(@"🐶")
    .selecTextImageNameSet(@"🐱")
    .wSelectMoreSet(YES)
    .wInsertaBleSet(YES)
    .wSelectOneSet(YES)
    .wClosableSet(YES)
    .wLineaBleSet(YES)
    .wLineNumSet(0)
    .wTypeSet(danger)
    .wSizeSet(small)
    .imagePositionSet(TagImagePositionLeft)
    .wBackGroundColorSet([WMZTagsTool stringTOColor:@"#999999"])
    .wSelectBoderColorSet([UIColor redColor])
    .wSelectInnerColorSet([UIColor redColor])
    .wSelectColorSet([UIColor redColor])
    .marginTopSet(10)
    .marginBottomSet(10)
    .marginLeftSet(10)
    .marginRightSet(10)
    .paddingTopSet(20)
    .paddingLeftSet(20)
    .btnTopSet(30)
    .btnLeftSet(30)
    .btnPaddingLeftSet(5)
    .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(CGRectGetMaxY(tag1.frame)+30);
        make.width.mas_equalTo(350);
    })
    .wMoreTapClick(^(NSArray * _Nonnull indexArr, NSArray * _Nonnull modelArr) {
        NSLog(@"多点方法 ： %@, %@",indexArr,modelArr);
    })
    .wTapClick(^(NSInteger index, id  _Nonnull model, BOOL isSelected) {
        NSLog(@"单点方法 ： %ld, %@, %d",index,model,isSelected);
    })
    .wCloseClick(^(NSInteger index, id  _Nonnull model, NSArray * _Nonnull modelArr) {
        NSLog(@"关闭方法 ： %ld, %@   %@",index,model,modelArr);
        [weakSelf update];
    })
    .wInsertTextClick(^(NSString * _Nonnull text, NSArray * _Nonnull modelArr) {
        NSLog(@"添加的回调 %@ %@",text,modelArr);
        [weakSelf update];
    })
    .wInsertClick(^(NSInteger index, id  _Nonnull model, InsertTextBlock  _Nonnull block) {
        NSLog(@"自定义添加的事件");
        UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"增加标签" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alerVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        }];
        
        [alerVC addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
            UITextField *textfield1 = alerVC.textFields[0];
            block(textfield1.text);
        }]];
        [weakSelf presentViewController:alerVC animated:YES completion:nil];
    })
    ;
    self.tag2 = [[WMZTags alloc]initConfigureWithModel:model1 withView:self.scrollView];

    [self update];

}

- (void)update{
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = CGSizeMake(TagWitdh, CGRectGetMaxY(self.tag2.frame)+20);
}


@end
