



//
//  tagOneCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagOneCell.h"
@interface tagOneCell(){
    NSArray *_model;
}
@end
@implementation tagOneCell


- (void)setModel:(NSArray *)model{
    _model = model;
    self.param.wInsertaBleSet(NO).wSelectOneSet(YES).wDataSet(model).wTagAlignSet(TagAlignRight)
    .wTapClick(^(NSInteger index, id  _Nonnull model, BOOL isSelected) {
        NSLog(@"单点的点击回调 %ld %@  %@",index,model,isSelected?@"选中":@"取消选中");
    })
    .imageNameSet(@"notCheck").selectImageNameSet(@"check").wTypeSet(success) ;
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
