//
//  UIView+Extension.h
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 TailC. All rights reserved.
//

#import <UIKit/UIKit.h>

// View圆角和加边框
#define ViewBorderRadius(View,Radius,Width,Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]
//[View.layer setBorderColor:[Color CGColor]]
//[View.layer setBorderWidth:(Width)];\
//[View.layer setBorderColor:[Color CGColor]]

//#define ViewBorderRadius(View,Radius,Width,Color)\
//\
//[View.layer setCornerRadius:(Radius)];\
//[View.layer setMasksToBounds:YES];\
//[View.layer setBorderWidth:(Width)];\
//[View.layer setBorderColor:[Color CGColor]]

// View圆角
#define ViewRadius(View,Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

//=========================================
/**
 *  使用贝塞尔曲线画圆角
 *
 *  @param radius 半径
 */
- (void)setViewWithMaskCornerRadius:(CGFloat)radius;

/**
 *
 * 响应者链
 */
- (UIViewController *)viewController;

/**
 *
 * 裁剪成圆形
 */
- (void)setLayerCornerRadius:(CGFloat)cornerRadius;

/**判断一个空间是否是真正显示在主窗口 */
- (BOOL)isShowingOnKeyWindow;

//xib加载
+ (instancetype)viewFromXib;

// 查找子视图且不会保存
//view      要查找的视图
// clazzName 子控件类名
/// @return 找到的第一个子视图
+ (UIView *)hh_foundViewInView:(UIView *)view clazzName:(NSString *)clazzName;

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/// 获取当前cell所在的viewcontroller
- (UIViewController *)curViewController;

/// 给Constraint添加动画
- (void)constraintAnimateWithConstraint:(NSLayoutConstraint *)constraint
                            andConstant:(NSInteger)constant;

@end
