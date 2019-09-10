



//
//  tagOneCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagOneCell.h"

@implementation tagOneCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        self.param =
        TagParam()
        .wDataSet(@[@"1",@"2"])
        .wSelectOneSet(YES)
        .wTagAlignSet(TagAlignRight)
        .wTapClick(^(NSInteger index, id  _Nonnull model, BOOL isSelected) {
            NSLog(@"单点的点击回调 %ld %@  %@",index,model,isSelected?@"选中":@"取消选中");
        }) 
         .imageNameSet(@"notCheck").selectImageNameSet(@"check").wTypeSet(success)
        .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
            make.top.left.bottom.mas_equalTo(0);
            make.width.mas_equalTo(TagWitdh);
        });
        self.myTag = [[WMZTags alloc]initConfigureWithModel:self.param withView:self.contentView];
        
    }
    return self;
}

- (void)setModel:(NSArray *)model{
    [super setModel:model];
    self.param.wDataSet(model)
    //默认选中第三个 从0开始
    .wSelectIndexDataSet(@[@(2)]);
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
