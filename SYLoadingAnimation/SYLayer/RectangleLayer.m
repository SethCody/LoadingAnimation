//
//  RectangleLayer.m
//  LoadingAnimationDemo
//
//  Created by SethYin on 16/6/21.
//  Copyright © 2016年 SethYin. All rights reserved.
//

#import "RectangleLayer.h"

@interface RectangleLayer ()

@property (strong, nonatomic) UIBezierPath *rectangleFullPath;

@end

@implementation RectangleLayer

- (instancetype)init {
    if (self == [super init]) {
        self.fillColor = [UIColor clearColor].CGColor;
        self.lineWidth = 2;
        self.path = self.rectangleFullPath.CGPath;
    }
    return self;
}

- (UIBezierPath *)rectangleFullPath {
    if (!_rectangleFullPath) {
        _rectangleFullPath = [[UIBezierPath alloc] init];
        [_rectangleFullPath moveToPoint:CGPointMake(screenWidth/2 - 64 + 1, screenHeight/2  - 104 + 128 - 1)];
        [_rectangleFullPath addLineToPoint:CGPointMake(screenWidth/2 - 64 + 1, screenHeight/2  - 104)];
        [_rectangleFullPath addLineToPoint:CGPointMake(screenWidth/2 - 64 + 128, screenHeight/2  - 104 - 1)];
        [_rectangleFullPath addLineToPoint:CGPointMake(screenWidth/2 - 64 + 128, screenHeight/2  - 104 + 128 - 1)];
        [_rectangleFullPath closePath];
    }
    return _rectangleFullPath;
}

- (void)strokeChangeWithColor:(UIColor *)color {
    self.strokeColor = color.CGColor;
    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.fromValue = @0.0;
    strokeAnimation.toValue = @1.0;
    strokeAnimation.duration = 0.8;
    [self addAnimation:strokeAnimation forKey:nil];
}


@end
