



//
//  tagThreeCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagThreeCell.h"
@implementation tagThreeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        __weak typeof(self) weakSelf = self;
        self.param =
        TagParam()
        .wCloseClick(^(NSInteger index, id  _Nonnull model,NSArray * _Nonnull modelArr) {
            NSLog(@"删除的回调 %ld %@ %@",index,model,modelArr);
            if ([weakSelf.delegate respondsToSelector:@selector(updateCell:data:)]) {
                [weakSelf.delegate updateCell:weakSelf data:modelArr];
            }
        })
        .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
            make.top.left.bottom.mas_equalTo(0);
            make.width.mas_equalTo(TagWitdh);
        })
        .wClosableSet(YES)
        .wTypeSet(warning);
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
