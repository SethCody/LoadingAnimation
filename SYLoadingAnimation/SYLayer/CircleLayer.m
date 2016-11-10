//
//  CircleLayer.m
//  LoadingAnimationDemo
//
//  Created by SethYin on 16/6/20.
//  Copyright © 2016年 SethYin. All rights reserved.
//

#import "CircleLayer.h"

@interface CircleLayer ()

/// 小圆路径
@property (strong, nonatomic) UIBezierPath *circleSmallPath;
/// 大圆路径
@property (strong, nonatomic) UIBezierPath *circleBigPath;
/// 竖直压缩后路径
@property (strong, nonatomic) UIBezierPath *circleVerticalSquishPath;
/// 水平压缩后路径
@property (strong, nonatomic) UIBezierPath *circleHorizontalSquishPath;

@end

static const NSTimeInterval KAnimationDuration = 0.2;

static const NSTimeInterval KAnimationBeginTime = 0.0;

@implementation CircleLayer

- (instancetype)init{
    self = [super init];
    if (self) {
        self.fillColor = [[UIColor colorWithRed:0.85 green:0.44 blue:0.84 alpha:1.00] CGColor];
        self.path = self.circleSmallPath.CGPath;
    }
    return self;
}

- (UIBezierPath *)circleSmallPath {
    if (!_circleSmallPath) {
        _circleSmallPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(screenWidth/2, screenHeight/2, 0.0, 0.0)];
    }
    return _circleSmallPath;
}

- (UIBezierPath *)circleBigPath {
    if (!_circleBigPath) {
        _circleBigPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake((screenWidth - circleDiameter)/2, (screenHeight - circleDiameter)/2, circleDiameter, circleDiameter)];
    }
    return _circleBigPath;
}

- (UIBezierPath *)circleVerticalSquishPath {
    if (!_circleVerticalSquishPath) {
        _circleVerticalSquishPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake((screenWidth - circleDiameter)/2, (screenHeight - circleDiameter)/2 +  circleSquish , circleDiameter, circleDiameter - 2 * circleSquish)];
    }
    return _circleVerticalSquishPath;
}

- (UIBezierPath *)circleHorizontalSquishPath {
    if (!_circleHorizontalSquishPath) {
        _circleHorizontalSquishPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake((screenWidth - circleDiameter)/2 + circleSquish, (screenHeight - circleDiameter)/2 +  circleSquish , circleDiameter - 2 * circleSquish, circleDiameter  - 2 * circleSquish)];
    }
    return _circleHorizontalSquishPath;
}

- (void)expand {
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation.fromValue = (__bridge id _Nullable)(self.circleSmallPath.CGPath);
    expandAnimation.toValue = (__bridge id _Nullable)(self.circleBigPath.CGPath);
    expandAnimation.duration = KAnimationDuration;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = NO;
    [self addAnimation:expandAnimation forKey:nil];
}

- (void)contract {
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation.fromValue = (__bridge id _Nullable)(self.circleBigPath.CGPath);
    expandAnimation.toValue = (__bridge id _Nullable)(self.circleSmallPath.CGPath);
    expandAnimation.duration = KAnimationDuration;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = NO;
    [self addAnimation:expandAnimation forKey:nil];
}

- (void)wobbleAnimation {
    //  1.竖直方向压缩
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation1.fromValue = (__bridge id _Nullable)(self.circleBigPath.CGPath);
    animation1.toValue = (__bridge id _Nullable)(self.circleVerticalSquishPath.CGPath);
    animation1.beginTime = KAnimationBeginTime;
    animation1.duration = KAnimationDuration;
    //  2.水平方向压缩
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation2.fromValue = (__bridge id _Nullable)(self.circleVerticalSquishPath.CGPath);
    animation2.toValue = (__bridge id _Nullable)(self.circleHorizontalSquishPath.CGPath);
    animation2.beginTime = animation1.beginTime + animation1.duration;
    animation2.duration = KAnimationDuration;
    //  3.竖直方向伸展
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation3.fromValue = (__bridge id _Nullable)(self.circleHorizontalSquishPath.CGPath);
    animation3.toValue = (__bridge id _Nullable)(self.circleVerticalSquishPath.CGPath);
    animation3.beginTime = animation2.beginTime + animation2.duration;
    animation3.duration = KAnimationDuration;
    //  4.水平方向伸展
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation4.fromValue = (__bridge id _Nullable)(self.circleVerticalSquishPath.CGPath);
    animation4.toValue = (__bridge id _Nullable)(self.circleBigPath.CGPath);
    animation4.beginTime = animation3.beginTime + animation3.duration;
    animation4.duration = KAnimationDuration;
    //  5.还原到最初状态
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[animation1, animation2, animation3, animation4];
    animationGroup.duration = 4 * KAnimationDuration;
    animationGroup.repeatCount = 2;
    [self addAnimation:animationGroup forKey:nil];
}


@end
