



//
//  tagThreeCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagThreeCell.h"
@interface tagThreeCell(){
    NSArray *_model;
}

@end
@implementation tagThreeCell


- (void)setModel:(NSArray *)model{
    _model = model;
     __weak typeof(self) weakSelf = self;
    self.param
    .wCloseClick(^(NSInteger index, id  _Nonnull model,NSArray * _Nonnull modelArr) {
         NSLog(@"删除的回调 %ld %@ %@",index,model,modelArr);
        if ([weakSelf.delegate respondsToSelector:@selector(updateCell:data:)]) {
            [weakSelf.delegate updateCell:weakSelf data:modelArr];
        }
    })
    .wLineaBleSet(YES)
    .wLineNumSet(3)
    .wClosableSet(YES).wDataSet(model).wTypeSet(warning);
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
