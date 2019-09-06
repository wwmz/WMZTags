


//
//  tagTwoCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagTwoCell.h"

@implementation tagTwoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        self.param =
        TagParam()
        .wSelectMoreSet(YES).textImageNameSet(@"💖").selecTextImageNameSet(@"❤️")
        .imagePositionSet(TagImagePositionLeft).wTypeSet(info)
        .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
            make.top.left.bottom.mas_equalTo(0);
            make.width.mas_equalTo(TagWitdh);
        })
        .wMoreTapClick(^(NSArray * _Nonnull indexArr, NSArray * _Nonnull modelArr) {
            NSLog(@"多点的点击回调 %@ %@",indexArr,modelArr);
        });
        self.myTag = [[WMZTags alloc]initConfigureWithModel:self.param withView:self.contentView];
        
    }
    return self;
}

- (void)setModel:(NSArray *)model{
    [super setModel:model];      //默认选中 位于数组中的下标
    self.param.wDataSet(model).wSelectIndexDataSet(@[@(1),@(3),@(5)])
    ;
    [self.myTag updateUI];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
