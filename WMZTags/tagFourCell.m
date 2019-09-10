



//
//  tagFourCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagFourCell.h"
@implementation tagFourCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
                __weak typeof(self) weakSelf = self;
        self.param =
        TagParam()
        .wInsertTextClick(^(NSString * _Nonnull text, NSArray * _Nonnull modelArr) {
            if ([weakSelf.delegate respondsToSelector:@selector(updateCell:data:)]) {
                [weakSelf.delegate updateCell:weakSelf data:modelArr];
            }
        })
        .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
            make.top.left.bottom.mas_equalTo(0);
            make.width.mas_equalTo(TagWitdh);
        })
        .wInsertaBleSet(YES).wTagAlignSet(TagAlignRight)
        .wHitSet(YES).wTypeSet(danger).wSizeSet(mini);
        self.myTag = [[WMZTags alloc]initConfigureWithModel:self.param withView:self.contentView];
        
    }
    return self;
}
- (void)setModel:(NSArray *)model{
    [super setModel:model];
    self.param.wDataSet(model);
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
