# WMZTags
# 功能齐全采用链式编程
看下效果图
![Untitled.gif](https://upload-images.jianshu.io/upload_images/9163368-cd494a9b677ea592.gif?imageMogr2/auto-orient/strip)

使用说明（简单使用,支持frame布局和masonry布局）

```
 //frame使用
  WMZTagParam *model = TagParam()
  .wDataSet(@[@"标签一",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六"])
  .wParentViewSet(self.scrollView)
  .wFrameSet(CGRectMake(10, 10, 310, 0))
  WMZTags *tag1 = [[WMZTags alloc]initConfigureWithModel:model];
```

```
 //masonry使用
  WMZTagParam *model = TagParam()
  .wDataSet(@[@"标签一",@"标签二",@"标签三",@"标签四",@"标签五",@"标签六"])
  .wParentViewSet(self.scrollView)
  .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(CGRectGetMaxY(tag1.frame)+30);
        make.width.mas_equalTo(350);
  });
  WMZTags *tag1 = [[WMZTags alloc]initConfigureWithModel:model];
```

* * *
##其他用法参数说明
![87A7F1EE-0566-4011-BA5C-022BD159F9FA.png](https://upload-images.jianshu.io/upload_images/9163368-3cbd369851830966.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


##实际使用
```
     TagParam()
    .imageNameSet(@"notCheck")                                                           //未选择的图片
    .selectImageNameSet(@"check")                                                      //选择的图片
    .wHitSet(YES)                                                                                        //开启边框描边
    .wRadiusSet(10)                                                                                    //圆角
    .wBoderWidthSet(1)                                                                             //边框宽度
    .wBoderColorSet([UIColor cyanColor])                                             //边框颜色
    .textImageNameSet(@"🐶")                                                               //未选择的文字图片（优先级高于纯图片）
    .selecTextImageNameSet(@"🐱")                                                     //选择的文字图片
    .wSelectMoreSet(YES)                                                                         //开启多选
    .wInsertaBleSet(YES)                                                                            //开启新增标签
    .wSelectOneSet(YES)                                                                            //开启单选
    .wClosableSet(YES)                                                                               //开启关闭
    .wLineaBleSet(YES)                                                                              //开启标签换行
    .wLineNumSet(0)                                                                                 //设置标签最大行数
    .wTypeSet(danger)                                                                              //设置主题
    .wSizeSet(small)                                                                                 //设置标签大小
    .imagePositionSet(TagImagePositionLeft)                                        //设置图文的位置
    .wBackGroundColorSet([WMZTool stringTOColor:@"#999999"])//设置整个的背景颜色
    .wSelectBoderColorSet([UIColor redColor])                                     //设置标签选中时的边框颜色
    .wSelectInnerColorSet([UIColor redColor])                                       //设置标签选中时的标签的背景颜色                                    
    .wSelectColorSet([UIColor redColor])                                                 //设置标签选中时的文字颜色
    .marginTopSet(10)                                                                                 //外上边距
    .marginBottomSet(10)                                                                           //外下边距
    .marginLeftSet(10)                                                                                //外左边距
    .marginRightSet(10)                                                                             //外右边距
    .paddingTopSet(20)                                                                              //内上边距
    .paddingLeftSet(20)                                                                              //内左边距
    .btnTopSet(30)                                                                                      //标签的左边距
    .btnLeftSet(30)                                                                                      //标签的上边距
    .btnPaddingLeftSet(5)                                                                           //标签图文的间距
    .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(CGRectGetMaxY(tag1.frame)+30);
        make.width.mas_equalTo(350);
    })
    .wMoreTapClick(^(NSArray * _Nonnull indexArr, NSArray * _Nonnull modelArr) {
        NSLog(@"多点方法 ： %@, %@",indexArr,modelArr);
    })
    .wTapClick(^(NSInteger index, id  _Nonnull model, BOOL isSelected) {
        NSLog(@"单点方法 ： %ld, %@, %d",index,model,isSelected);
    })
    .wCloseClick(^(NSInteger index, id  _Nonnull model, NSArray * _Nonnull modelArr) {
        NSLog(@"关闭方法 ： %ld, %@   %@",index,model,modelArr);
        [weakSelf update];
    })
    .wInsertTextClick(^(NSString * _Nonnull text, NSArray * _Nonnull modelArr) {
        NSLog(@"添加的回调 %@ %@",text,modelArr);
        [weakSelf update];
    })
    .wInsertClick(^(NSInteger index, id  _Nonnull model, InsertTextBlock  _Nonnull block) {
        NSLog(@"自定义添加的事件");
        UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"增加标签" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alerVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        }];
        
        [alerVC addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
            UITextField *textfield1 = alerVC.textFields[0];
            block(textfield1.text);
        }]];
        [self presentViewController:alerVC animated:YES completion:nil];
    }}   ;
```
