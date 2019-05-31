



//
//  tagFiveCell.m
//  WMZTags
//
//  Created by wmz on 2019/5/29.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "tagFiveCell.h"

@interface tagFiveCell(){
    NSArray *_model;
}

@end
@implementation tagFiveCell


- (void)setModel:(NSArray *)model{
    _model = model;
    __weak typeof(self) weakSelf = self;
    self.param.wDataSet(model)
    .wInsertaBleSet(YES)
    .wInsertTextClick(^(NSString * _Nonnull text, NSArray * _Nonnull modelArr) {
        if ([weakSelf.delegate respondsToSelector:@selector(updateCell:data:)]) {
            [weakSelf.delegate updateCell:weakSelf data:modelArr];
        }
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
