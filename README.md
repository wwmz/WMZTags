# WMZBanner - 仿前端element-UI框架的标签

演示
==============
![Tags.gif](https://upload-images.jianshu.io/upload_images/9163368-d63961ad20d96c0e.gif?imageMogr2/auto-orient/strip)

特性
==============
- 链式语法 结构优雅
- 所有属性(颜色,字体,宽度,高度,圆角等)样式均可自定义、
-  支持增加
-  支持删除
-  支持单点选中
-  支持多点选中
-  支持默认选中
-  支持左/右对齐
-  默认多个size可选
-  默认多个风格可选


用法
==============

### 简单调用只显示
    WMZTagParam *model = 
    TagParam()
    .wDataSet(@[])
    .wFrameSet(CGRectMake(10, 10, 310, 0));
    WMZTags *tag1 = [[WMZTags alloc]initConfigureWithModel:model  withView:self.scrollView];


### 单选
	
    TagParam()
    .wDataSet(@[@"1",@"2"])
    .wSelectOneSet(YES)
    .wTapClick(^(NSInteger index, id  _Nonnull model, BOOL isSelected) {
          NSLog(@"单点的点击回调 %ld %@  %@",index,model,isSelected?@"选中":@"取消选中");
    }) 
    .imageNameSet(@"notCheck")
    .selectImageNameSet(@"check").wTypeSet(success)
    .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
          make.top.left.bottom.mas_equalTo(0);
          make.width.mas_equalTo(TagWitdh);
    });
    
##### 多选

    TagParam()
    .wSelectMoreSet(YES)
    .textImageNameSet(@"💖")
    .selecTextImageNameSet(@"❤️")
    .imagePositionSet(TagImagePositionLeft).wTypeSet(info)
    .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
         make.top.left.bottom.mas_equalTo(0);
         make.width.mas_equalTo(TagWitdh);
    })
    .wMoreTapClick(^(NSArray * _Nonnull indexArr, NSArray * _Nonnull modelArr) {
        NSLog(@"多点的点击回调 %@ %@",indexArr,modelArr);
    });
    
##### 删除

    TagParam()
    .wCloseClick(^(NSInteger index, id  _Nonnull model,NSArray * _Nonnull modelArr) {
        NSLog(@"删除的回调 %ld %@ %@",index,model,modelArr);
     })
     .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
        make.top.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(TagWitdh);
    })
    .wClosableSet(YES)
    .wTypeSet(warning);
    
##### 增加
    TagParam()
     .wInsertTextClick(^(NSString * _Nonnull text, NSArray * _Nonnull modelArr) {
         NSLog(@"新增回调");
     })
    .wMasonrySet(^(MASConstraintMaker * _Nonnull make) {
         make.top.left.bottom.mas_equalTo(0);
         make.width.mas_equalTo(TagWitdh);
    })
    .wInsertaBleSet(YES);
    
##### 刷新
    .wDataSet(@[])后
    直接调用实例方法updateUI
    [[WMZTags new] updateUI]
    
##### 数据变化后tableview的刷新
    tableviewCell的WMZTagDelegate代理方法
    //用于外部刷新 
    -(void)updateCell:(id)cell data:(NSArray*)data;
    要在tableview上使用需要继承WMZTagCell 可以看demo

##### 其他可配置的全部参数说明
    参数                 说明              类型                      可选值                默认值        是否必传
    wFrame              frame布局         CGRect                       —                   -            是（和maronsy二选一）
    wMasonry            masonry布局       TagConstraint                —                   -            是（和wFrame二选一）
    wData               数据源             NSArray                     —                    -            是
    wSelectIndexData    默认选中的数据源(传下标)NSArray                  —                    -            是
    wType               主题              TagColorType    success/info/warning/danger      —            否
    wInsertaBle         是否可增加         Boolean                     _                  false          否
    wClosable           是否可删除         Boolean                     —                  false          否
    wSelectOne          是否可单选         Boolean                     —                  false          否
    wSelectMore         是否可多选         Boolean                     —                  false          否
    wTagAlign           标签对齐模式       TagAlign       TagAlignLeft/TagAlignRight   TagAlignLeft       否
    wHit                是否有边框描边      Boolean                     —                  false          否
    wRadius             圆角              CGFloat                     —              5(最大为高度的一半)   否
    wBoderWidth         边框宽度           CGFloat                     _                    1            否
    wBoderColor         边框颜色           UIColor                     —                  #5297E1        否
    wColor              字体颜色           UIColor                     —                  #5297E1        否
    wBackGroundColor    外部背景色         UIColor                     —                  #ffffff        否
    wInnerColor         内部背景色         UIColor                     —                  #CEE1F7        否
    wSelectBoderColor   选中边框颜色        UIColor                     —                   #ED4985       否
    wSelectColor        选中字体颜色        UIColor                     —                   #ED4985       否
    wSelectInnerColor   选中内部背景色      UIColor                      —                  #F4C4C4       否
    wSize               尺寸              TagSizeType        medium / small / mini         —            否
    wFont               字体大小          CGFloat                     —                    14            否
    marginLeft          外左边距          CGFloat                     _                    5             否
    marginRight         外右边距          CGFloat                     _                    0             否
    marginTop           外上边距          CGFloat                     _                   10             否
    marginBottom        外下边距          CGFloat                     _                   10             否
    paddingLeft         内左边距          CGFloat                     _                   10             否
    paddingTop          内上边距          CGFloat                     _                   10             否
    btnLeft             按钮上边距        CGFloat                      _                   20            否
    btnTop              按钮上边距        CGFloat                      _                   20            否
    btnPaddingLeft      图文间距          CGFloat                     _                    5             否
    textImageName       文本图片          NSString                    _                    _             否
    imageName           纯图片            NSString                    _                    _             否
    selecTextImageName  选中的纯图片       NSString                    _                    _             否
    selectImageName     选中的文本图片     NSString                     _                    _            否
    imagePosition       图文位置         TagImagePosition     top/left/bottom/right       right          否
    wInsertPlaceholder  插入标签提示语     NSString                     _                  +New tag       否

### 依赖
Masonry

安装
==============

### CocoaPods
1. 将 cocoapods 更新至最新版本.
2. 在 Podfile 中添加 `pod 'WMZTags'`。
3. 执行 `pod install` 或 `pod update`。
4. 导入 #import "WMZTags.h"。

### 注:要消除链式编程的警告 
要在Buildding Settings 把CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF 设为NO

### 手动安装

1. 下载 WMZTags 文件夹内的所有内容。
2. 将 WMZTags 内的源文件添加(拖放)到你的工程。
3. 导入 #import "WMZTags.h"

系统要求
==============
该库最低支持 `iOS 9.0` 和 `Xcode 9.0`。



许可证
==============
LEETheme 使用 MIT 许可证，详情见 [LICENSE](LICENSE) 文件。


个人主页
==============
使用过程中如果有什么bug欢迎给我提issue 我看到就会解决,如果对你有用的话给个star
[我的简书](https://www.jianshu.com/p/1b70159cdbd7)
[WMZTags](https://github.com/wwmz/WMZTags)


