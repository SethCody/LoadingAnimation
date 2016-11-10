//
//  WaveLayer.m
//  LoadingAnimationDemo
//
//  Created by SethYin on 16/6/21.
//  Copyright © 2016年 SethYin. All rights reserved.
//

#import "WaveLayer.h"

@interface WaveLayer ()

@property (strong, nonatomic) UIBezierPath *wavePathPre;
@property (strong, nonatomic) UIBezierPath *wavePathStarting;
@property (strong, nonatomic) UIBezierPath *wavePathLow;
@property (strong, nonatomic) UIBezierPath *wavePathMid;
@property (strong, nonatomic) UIBezierPath *wavePathHigh;
@property (strong, nonatomic) UIBezierPath *wavePathComplete;

@end

static const NSTimeInterval KAnimationDuration = 0.15;

@implementation WaveLayer

- (instancetype)init {
    if (self == [super init]) {
        self.fillColor = [UIColor colorWithRed:0.25 green:0.88 blue:0.69 alpha:1.00].CGColor;
        self.path = self.wavePathComplete.CGPath;
    }
    return self;
}

//  CGRectMake(screenWidth/2 - 64, screenHeight/2  - 104, 128, 128)

//  screenWidth/2 - 64, screenHeight/2  - 64, 128, 88
//  screenWidth/2 + 64 screenHeight/2 + 64

- (UIBezierPath *)wavePathPre {
    if (!_wavePathPre) {
        _wavePathPre = [[UIBezierPath alloc] init];
        [_wavePathPre moveToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathPre addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 118)];
        [_wavePathPre addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 118)];
        [_wavePathPre addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 128)];
        [_wavePathPre addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathPre closePath];
    }
    return _wavePathPre;
}

- (UIBezierPath *)wavePathStarting {
    if (!_wavePathStarting) {
        _wavePathStarting = [[UIBezierPath alloc] init];
        [_wavePathStarting moveToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathStarting addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 108)];
//        [_wavePathStarting addCurveToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 108) controlPoint1:CGPointMake(screenWidth/2 - 64 + 32, screenHeight/2  - 104  + 88) controlPoint2:CGPointMake(screenWidth/2 - 64 + 64, screenHeight/2  - 104 + 148)];
        [_wavePathStarting addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 108)];
        [_wavePathStarting addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 128)];
        [_wavePathStarting addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathStarting closePath];
    }
    return _wavePathStarting;
}

- (UIBezierPath *)wavePathLow {
    if (!_wavePathLow) {
        _wavePathLow = [[UIBezierPath alloc] init];
        [_wavePathLow moveToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathLow addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 78)];
//        [_wavePathLow addCurveToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 88) controlPoint1:CGPointMake(screenWidth/2 - 64 + 32, screenHeight/2  - 104  + 68) controlPoint2:CGPointMake(screenWidth/2 - 64 + 64, screenHeight/2  - 104 + 148)];
        [_wavePathLow addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 78)];
        [_wavePathLow addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 128)];
        [_wavePathLow addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathLow closePath];
    }
    return _wavePathLow;
}

- (UIBezierPath *)wavePathMid {
    if (!_wavePathMid) {
        _wavePathMid = [[UIBezierPath alloc] init];
        [_wavePathMid moveToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathMid addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 48)];
//        [_wavePathMid addCurveToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 68) controlPoint1:CGPointMake(screenWidth/2 - 64 + 32, screenHeight/2  - 104  + 48) controlPoint2:CGPointMake(screenWidth/2 - 64 + 64, screenHeight/2  - 104 + 128)];
        [_wavePathMid addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 48)];
        [_wavePathMid addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 128)];
        [_wavePathMid addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathMid closePath];
    }
    return _wavePathMid;
}

- (UIBezierPath *)wavePathHigh {
    if (!_wavePathHigh) {
        _wavePathHigh = [[UIBezierPath alloc] init];
        [_wavePathHigh moveToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathHigh addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 18)];
//        [_wavePathHigh addCurveToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 108) controlPoint1:CGPointMake(screenWidth/2 - 64 + 32, screenHeight/2  - 104  + 88) controlPoint2:CGPointMake(screenWidth/2 - 64 + 64, screenHeight/2  - 104 + 148)];
        [_wavePathHigh addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 18)];
        [_wavePathHigh addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 128)];
        [_wavePathHigh addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathHigh closePath];
    }
    return _wavePathHigh;
}

- (UIBezierPath *)wavePathComplete {
    if (!_wavePathComplete) {
        _wavePathComplete = [[UIBezierPath alloc] init];
        [_wavePathComplete moveToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathComplete addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104)];
        [_wavePathComplete addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104)];
        [_wavePathComplete addLineToPoint:CGPointMake(screenWidth/2 + 64, screenHeight/2  - 104 + 128)];
        [_wavePathComplete addLineToPoint:CGPointMake(screenWidth/2 - 64, screenHeight/2  - 104 + 128)];
        [_wavePathComplete closePath];
    }
    return _wavePathComplete;
}

- (void)waveAnimate {
    //    1
    CABasicAnimation *waveAnimationPre = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationPre.fromValue = (__bridge id _Nullable)(self.wavePathPre.CGPath);
    waveAnimationPre.toValue = (__bridge id _Nullable)(self.wavePathStarting.CGPath);
    waveAnimationPre.beginTime = 0.0;
    waveAnimationPre.duration = KAnimationDuration;
    waveAnimationPre.fillMode = kCAFillModeForwards;
    waveAnimationPre.removedOnCompletion = NO;
    //    2
    CABasicAnimation *waveAnimationLow = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationLow.fromValue = (__bridge id _Nullable)(self.wavePathStarting.CGPath);
    waveAnimationLow.toValue = (__bridge id _Nullable)(self.wavePathLow.CGPath);
    waveAnimationLow.beginTime = waveAnimationPre.beginTime + waveAnimationPre.duration;
    waveAnimationLow.duration = KAnimationDuration;
    //    3
    CABasicAnimation *waveAnimationMid = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationMid.fromValue = (__bridge id _Nullable)(self.wavePathLow.CGPath);
    waveAnimationMid.toValue = (__bridge id _Nullable)(self.wavePathMid.CGPath);
    waveAnimationMid.beginTime = waveAnimationLow.beginTime + waveAnimationLow.duration;
    waveAnimationMid.duration = KAnimationDuration;
    //    4
    CABasicAnimation *waveAnimationHigh = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationHigh.fromValue = (__bridge id _Nullable)(self.wavePathMid.CGPath);
    waveAnimationHigh.toValue = (__bridge id _Nullable)(self.wavePathHigh.CGPath);
    waveAnimationHigh.beginTime = waveAnimationMid.beginTime + waveAnimationMid.duration;
    waveAnimationHigh.duration = KAnimationDuration;
    //    5
    CABasicAnimation *waveAnimationComplete = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationComplete.fromValue = (__bridge id _Nullable)(self.wavePathHigh.CGPath);
    waveAnimationComplete.toValue = (__bridge id _Nullable)(self.wavePathComplete.CGPath);
    waveAnimationComplete.beginTime = waveAnimationHigh.beginTime + waveAnimationHigh.duration;
    waveAnimationComplete.duration = KAnimationDuration;
    //    6
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[waveAnimationPre, waveAnimationLow,waveAnimationMid,waveAnimationHigh,waveAnimationComplete];
    animationGroup.duration = waveAnimationComplete.beginTime + waveAnimationComplete.duration;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [self addAnimation:animationGroup forKey:nil];
}

@end
