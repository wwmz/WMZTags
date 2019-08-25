


//
//  tagTwoCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagTwoCell.h"

@interface tagTwoCell(){
    NSArray *_model;
}
@end
@implementation tagTwoCell
@dynamic tag;

- (void)setModel:(NSArray *)model{
    _model = model;
    self.param.wSelectMoreSet(YES).wDataSet(model).textImageNameSet(@"💖").selecTextImageNameSet(@"❤️")
    .imagePositionSet(TagImagePositionLeft).wTypeSet(info)
    .wMoreTapClick(^(NSArray * _Nonnull indexArr, NSArray * _Nonnull modelArr) {
        NSLog(@"多点的点击回调 %@ %@",indexArr,modelArr);
    });
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
