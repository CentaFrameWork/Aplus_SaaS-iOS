//
//  LMarqueeView.m
//  APlus
//
//  Created by 李慧娟 on 2017/11/9.
//  Copyright © 2017年 CentaLine. All rights reserved.
//

#import "LMarqueeView.h"


@implementation LMarqueeView
{
    CGRect _ShowFrame;      // 正在显示的坐标
    CGRect _UpHiddenFrame;  // 向上隐藏的坐标
    CGRect _DownHiddenframe;// 向下隐藏的坐标

    UIButton *_mainBtn;
    NSInteger _showIndex;

    NSTimer *_mainTimer;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self allInit];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        [self allInit];
    }
    return self;
}

- (void)allInit
{
    CGFloat selfWidth = APP_SCREEN_WIDTH - 205;
    CGFloat selfHeight = 30;
    CGFloat width = selfWidth - 5;
    CGFloat height = selfHeight - (5 * 2);
    _ShowFrame = CGRectMake(5, 5, width, height);
    _UpHiddenFrame = CGRectMake(5, -width, width, height);
    _DownHiddenframe = CGRectMake(5, selfHeight, width, height);

    self.clipsToBounds = YES;
    _showIndex = 0;

    [self initView];
}

- (void)initView
{
    _mainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _mainBtn.frame = _ShowFrame;
    [_mainBtn setTitleColor:MainGrayFontColor forState:UIControlStateNormal];
    _mainBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _mainBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_mainBtn addTarget:self
                 action:@selector(btnClick:)
       forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_mainBtn];
}

- (void)btnClick:(UIButton *)btn
{
    // 暂停计时器
    [self pauseTimer];

    if (self.delegate && [self.delegate respondsToSelector:@selector(clickNewPropWithIndex:)])
    {
        [self.delegate clickNewPropWithIndex:_showIndex];
    }
}

#pragma mark - Timer Operation

// 开始计时器
- (void)startTimer
{
    if (_mainTimer == nil)
    {
        _mainTimer = [NSTimer scheduledTimerWithTimeInterval:5.0
                                                      target:self
                                                    selector:@selector(timerAction)
                                                    userInfo:nil repeats:YES];
    }
    else
    {
        // 接着执行之前的计时器
        [_mainTimer setFireDate:[NSDate distantPast]];
    }
}

// 暂停计时器
- (void)pauseTimer
{
    [_mainTimer setFireDate:[NSDate distantFuture]];
}

// 结束计时器
- (void)stopTimer
{
    if (_mainTimer != nil)
    {
        if ([_mainTimer isValid])
        {
            [_mainTimer invalidate];
            _mainTimer = nil;
        }
    }
}

- (void)timerAction
{
    _showIndex++;

    if (_showIndex > _titleArr.count - 1)
    {
        _showIndex = 0;
    }

    [UIView animateWithDuration:0.3 animations:^{
        _mainBtn.frame = _UpHiddenFrame;
    } completion:^(BOOL finished){

        _mainBtn.hidden = YES;
        _mainBtn.frame = _DownHiddenframe;
        _mainBtn.hidden = NO;
        [_mainBtn setTitle:_titleArr[_showIndex] forState:UIControlStateNormal];

        [UIView animateWithDuration:0.3
                         animations:^{
                             _mainBtn.frame = _ShowFrame;
                         }];
    }];

}

- (void)setTitleArr:(NSArray *)titleArr
{
    if (_titleArr != titleArr)
    {
        _titleArr = titleArr;
        [_mainBtn setTitle:_titleArr[0] forState:UIControlStateNormal];
        [self startTimer];
    }
}

@end
