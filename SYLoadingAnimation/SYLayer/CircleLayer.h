//
//  CircleLayer.h
//  LoadingAnimationDemo
//
//  Created by SethYin on 16/6/20.
//  Copyright © 2016年 SethYin. All rights reserved.
//

#import "SYLoadingSetting.h"
#import <QuartzCore/QuartzCore.h>

@interface CircleLayer : CAShapeLayer

/**
 *  @author SethYin
 *
 *  放大
 */
- (void)expand;

/**
 *  @author SethYin
 *
 *  缩小
 */
- (void)contract;

/**
 *  @author SethYin
 *
 *  气泡效果
 */
- (void)wobbleAnimation;

@end
