//
//  SYLoadingView.m
//  LoadingAnimationDemo
//
//  Created by SethYin on 16/6/20.
//  Copyright © 2016年 SethYin. All rights reserved.
//

#import "SYLoadingView.h"
#import "CircleLayer.h"
#import "TriangleLayer.h"
#import "RectangleLayer.h"
#import "WaveLayer.h"

@interface SYLoadingView ()
/// 圆形
@property (nonatomic, strong) CircleLayer *circleLayer;

@property (nonatomic, strong) TriangleLayer *triangleLayer;

@property (nonatomic, strong) RectangleLayer *redRectangleLayer,*blueRectangleLayer;

@property (strong, nonatomic) WaveLayer *waveLayer;

@end

@implementation SYLoadingView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addLayer];
    }
    return self;
}

- (void)addLayer{
    self.circleLayer = [[CircleLayer alloc] init];
    [self.layer addSublayer:self.circleLayer];
    [self.circleLayer expand];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(wobbleCircleLayer) userInfo:nil repeats:NO];
}

- (void)wobbleCircleLayer{
    [self.circleLayer wobbleAnimation];
    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(showTriangleAnimation) userInfo:nil repeats:NO];
}

- (void)showTriangleAnimation{
    [self.layer addSublayer:self.triangleLayer];
    [self.triangleLayer triangleAnimate];
    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(transformAnima) userInfo:nil repeats:NO];
}

- (void)transformAnima {
    [self transformRotationZ];
    [self.circleLayer contract];
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(drawRedRectangleAnimation) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(drawBlueRectangleAnimation) userInfo:nil repeats:NO];
}

- (void)transformRotationZ {
    self.layer.anchorPoint = CGPointMake(0.5,0.5);
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 2);
    rotationAnimation.duration = 0.4;
    rotationAnimation.removedOnCompletion = true;
    [self.layer addAnimation:rotationAnimation forKey:nil];
}

- (void)drawRedRectangleAnimation {
    [self.layer addSublayer:self.redRectangleLayer];
    [_redRectangleLayer strokeChangeWithColor:[UIColor colorWithRed:0.85 green:0.44 blue:0.84 alpha:1.00]];
}

- (void)drawBlueRectangleAnimation {
    [self.layer addSublayer:self.blueRectangleLayer];
    [_blueRectangleLayer strokeChangeWithColor:[UIColor colorWithRed:0.25 green:0.88 blue:0.69 alpha:1.00]];
    [NSTimer scheduledTimerWithTimeInterval:0.7 target:self selector:@selector(drawWaveAnimation) userInfo:nil repeats:NO];
}

- (void)drawWaveAnimation {
    [self.layer addSublayer:self.waveLayer];
    [_waveLayer waveAnimate];
    [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(expandView) userInfo:nil repeats:NO];
}

- (void)expandView {
    self.backgroundColor = [UIColor colorWithRed:0.25 green:0.88 blue:0.69 alpha:1.00];
    self.frame = CGRectMake(screenWidth/2 - 64, screenHeight/2  - 104, 128, 128);
    self.layer.sublayers = nil;
    [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = self.superview.frame;
    } completion:^(BOOL finished) {
        
    }];
}

- (CircleLayer *)circleLayer {
    if (!_circleLayer) {
        _circleLayer = [[CircleLayer alloc] init];
    }
    return _circleLayer;
}

- (TriangleLayer *)triangleLayer {
    if (!_triangleLayer) {
        _triangleLayer = [[TriangleLayer alloc] init];
    }
    return _triangleLayer;
}

- (RectangleLayer *)redRectangleLayer {
    if (!_redRectangleLayer) {
        _redRectangleLayer = [[RectangleLayer alloc] init];
    }
    return _redRectangleLayer;
}

- (RectangleLayer *)blueRectangleLayer {
    if (!_blueRectangleLayer) {
        _blueRectangleLayer = [[RectangleLayer alloc] init];
    }
    return _blueRectangleLayer;
}

- (WaveLayer *)waveLayer {
    if (!_waveLayer) {
        _waveLayer = [[WaveLayer alloc] init];
    }
    return _waveLayer;
}
@end
