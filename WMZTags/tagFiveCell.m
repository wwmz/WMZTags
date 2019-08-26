



//
//  tagFiveCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagFiveCell.h"
@implementation tagFiveCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        __weak typeof(self) weakSelf = self;
        self.param =
        TagParam()
        .wInsertaBleSet(YES)
        .wInsertTextClick(^(NSString * _Nonnull text, NSArray * _Nonnull modelArr) {
            if ([weakSelf.delegate respondsToSelector:@selector(updateCell:data:)]) {
                [weakSelf.delegate updateCell:weakSelf data:modelArr];
            }
        })
        .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
            make.edges.mas_equalTo(0);
            make.width.mas_equalTo(TagWitdh);
        })
        .wInsertClick(^(NSInteger index, id  _Nonnull model, InsertTextBlock  _Nonnull block) {
            UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"自定义增加标签" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alerVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            }];
            
            [alerVC addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
                UITextField *textfield1 = alerVC.textFields[0];
                block(textfield1.text);
            }]];
            [[WMZTool getCurrentVC] presentViewController:alerVC animated:YES completion:nil];
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
