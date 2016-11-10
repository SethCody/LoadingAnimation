//
//  TriangleLayer.m
//  LoadingAnimationDemo
//
//  Created by SethYin on 16/6/20.
//  Copyright © 2016年 SethYin. All rights reserved.
//

#import "TriangleLayer.h"

@interface TriangleLayer ()

/// 小三角路径
@property (strong, nonatomic) UIBezierPath *smallTrianglePath;
/// 突出左角路径
@property (strong, nonatomic) UIBezierPath *leftTrianglePath;
/// 突出右角路径
@property (strong, nonatomic) UIBezierPath *rightTrianglePath;
/// 突出上角路径
@property (strong, nonatomic) UIBezierPath *topTrianglePath;

@end

@implementation TriangleLayer

- (instancetype)init {
    if (self == [super init]) {
        self.fillColor = [UIColor colorWithRed:0.85 green:0.44 blue:0.84 alpha:1.00].CGColor;
        self.strokeColor = [UIColor colorWithRed:0.85 green:0.44 blue:0.84 alpha:1.00].CGColor;
        self.lineWidth = 8.0;
        self.lineCap = kCALineCapSquare;
        self.lineJoin = kCALineCapRound;
        self.path = self.smallTrianglePath.CGPath;
    }
    return self;
}

- (UIBezierPath *)smallTrianglePath {
    if (!_smallTrianglePath) {
        _smallTrianglePath = [[UIBezierPath alloc] init];
        [_smallTrianglePath moveToPoint:CGPointMake(screenWidth/2, screenHeight/2  - 20)];
        [_smallTrianglePath addLineToPoint:CGPointMake(screenWidth/2 - 20, screenHeight/2 + 20)];
        [_smallTrianglePath addLineToPoint:CGPointMake(screenWidth/2 + 20 , screenHeight/2 + 20)];
        [_smallTrianglePath closePath];
    }
    return _smallTrianglePath;
}

- (UIBezierPath *)leftTrianglePath {
    if (!_leftTrianglePath) {
        _leftTrianglePath = [[UIBezierPath alloc] init];
        [_leftTrianglePath moveToPoint:CGPointMake(screenWidth/2, screenHeight/2  - 20)];
        [_leftTrianglePath addLineToPoint:CGPointMake(screenWidth/2 - 20 - 40, screenHeight/2 + 20)];
        [_leftTrianglePath addLineToPoint:CGPointMake(screenWidth/2 + 20 , screenHeight/2 + 20)];
        [_leftTrianglePath closePath];
    }
    return _leftTrianglePath;
}

- (UIBezierPath *)rightTrianglePath {
    if (!_rightTrianglePath) {
        _rightTrianglePath = [[UIBezierPath alloc] init];
        [_rightTrianglePath moveToPoint:CGPointMake(screenWidth/2, screenHeight/2  - 20)];
        [_rightTrianglePath addLineToPoint:CGPointMake(screenWidth/2 - 20 - 40, screenHeight/2 + 20)];
        [_rightTrianglePath addLineToPoint:CGPointMake(screenWidth/2 + 20 + 40 , screenHeight/2 + 20)];
        [_rightTrianglePath closePath];
    }
    return _rightTrianglePath;
}

- (UIBezierPath *)topTrianglePath {
    if (!_topTrianglePath) {
        _topTrianglePath = [[UIBezierPath alloc] init];
        [_topTrianglePath moveToPoint:CGPointMake(screenWidth/2, screenHeight/2  - 20 - 40)];
        [_topTrianglePath addLineToPoint:CGPointMake(screenWidth/2 - 20 - 40, screenHeight/2 + 20)];
        [_topTrianglePath addLineToPoint:CGPointMake(screenWidth/2 + 20 + 40 , screenHeight/2 + 20)];
        [_topTrianglePath closePath];
    }
    return _topTrianglePath;
}

- (void)triangleAnimate {
    //    left
    CABasicAnimation *triangleAnimationLeft = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationLeft.fromValue = (__bridge id _Nullable)(self.smallTrianglePath.CGPath);
    triangleAnimationLeft.toValue = (__bridge id _Nullable)(self.leftTrianglePath.CGPath);
    triangleAnimationLeft.beginTime = 0.0;
    triangleAnimationLeft.duration = 0.3;
    //    right
    CABasicAnimation *triangleAnimationRight = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationRight.fromValue = (__bridge id _Nullable)(self.leftTrianglePath.CGPath);
    triangleAnimationRight.toValue = (__bridge id _Nullable)(self.rightTrianglePath.CGPath);
    triangleAnimationRight.beginTime = triangleAnimationLeft.beginTime + triangleAnimationLeft.duration;
    triangleAnimationRight.duration = 0.25;
    //    top
    CABasicAnimation *triangleAnimationTop = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationTop.fromValue = (__bridge id _Nullable)(self.rightTrianglePath.CGPath);
    triangleAnimationTop.toValue = (__bridge id _Nullable)(self.topTrianglePath.CGPath);
    triangleAnimationTop.beginTime = triangleAnimationRight.beginTime + triangleAnimationRight.duration;
    triangleAnimationTop.duration = 0.2;
    //    group
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[triangleAnimationLeft, triangleAnimationRight, triangleAnimationTop];
    animationGroup.duration = triangleAnimationTop.beginTime + triangleAnimationTop.duration;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [self addAnimation:animationGroup forKey:nil];
}


@end
