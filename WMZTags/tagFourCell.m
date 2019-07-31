



//
//  tagFourCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagFourCell.h"
@interface tagFourCell(){
    NSArray *_model;
}

@end
@implementation tagFourCell


- (void)setModel:(NSArray *)model{
    _model = model;
    __weak typeof(self) weakSelf = self;
    self.param.wDataSet(model)
    .wInsertTextClick(^(NSString * _Nonnull text, NSArray * _Nonnull modelArr) {
        if ([weakSelf.delegate respondsToSelector:@selector(updateCell:data:)]) {
            [weakSelf.delegate updateCell:weakSelf data:modelArr];
        }
    })
    .wInsertaBleSet(YES).wTagAlignSet(TagAlignRight)
    .wHitSet(YES).wTypeSet(danger).wSizeSet(mini);
    [self updateInnerData:self.param];
    
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
