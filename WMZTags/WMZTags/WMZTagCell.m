//
//  WMZTagCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/24.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "WMZTagCell.h"
#import "WMZTags.h"
#import "WMZTextView.h"
@interface WMZTagCell()
//tag
@property(nonatomic,strong)WMZTags *myTag;
@end
@implementation WMZTagCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //不设置的话 会固定拿到320的宽度
        self.contentView.frame = CGRectMake(0, 0, TagWitdh, self.contentView.frame.size.height);
        
        self.param =
        TagParam()
        .wDataSet(@[@"1",@"2"])
        .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
            make.edges.mas_equalTo(0);
        })
        .wParentViewSet(self.contentView);
        self.myTag = [[WMZTags alloc]initConfigureWithModel:_param];
        
    }
    return self;
}


- (void)setModel:(NSArray *)model{
    _model = model;
    self.param.wDataSet(model);
    [self updateInnerData:self.param];
    
}

- (void)updateInnerData:(WMZTagParam *)param{
//    self.myTag.param = param;
    [self.myTag updateUI:YES];
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
