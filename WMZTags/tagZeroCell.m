



//
//  tagZeroCell.m
//  WMZTags
//
//  Created by wmz on 2019/8/26.
//  Copyright © 2019 wmz. All rights reserved.
//

#import "tagZeroCell.h"

@implementation tagZeroCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.param =
        TagParam()
        .wDataSet(@[@"1",@"2"])
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
