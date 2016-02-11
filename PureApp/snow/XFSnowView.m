//
//  XFSnowView.m
//  PureApp
//
//  Created by 星风TB on 16/2/10.
//  Copyright © 2016年 星风. All rights reserved.
//

#import "XFSnowView.h"

@implementation XFSnowView

+ (Class)layerClass
{
    return [CAEmitterLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setup
{
    CAEmitterLayer *layer = (CAEmitterLayer*)self.layer;
    
    layer.emitterShape = kCAEmitterLayerLine;
    layer.emitterSize = CGSizeMake(self.frame.size.width, 0);
    layer.emitterPosition = CGPointMake(self.frame.size.width/2, 0);
    layer.renderMode = kCAEmitterLayerBackToFront;
    int index = 0;
    NSMutableArray *snows = [NSMutableArray arrayWithCapacity:self.snowImages.count];
    for (UIImage *image in self.snowImages) {
        CAEmitterCell *snow = [[CAEmitterCell alloc] init];
        snow.contents = (__bridge id _Nullable)(image.CGImage);
        snow.birthRate = self.birthRates.count > index ? [[self.birthRates objectAtIndex:index] floatValue] : 1;
        snow.lifetime = self.bounds.size.height/snow.velocity;
        snow.velocity = self.velocitys.count > index ? [[self.velocitys objectAtIndex:index] floatValue] : 10;
        snow.velocityRange = self.velocitys.count > index ? [[self.velocitys objectAtIndex:index] floatValue]/2 : 5;
        snow.emissionRange = M_PI_4;
        snow.emissionLongitude = M_PI;
        snow.spin = M_PI_4/4;
        snow.spinRange = M_PI_4/4;
        snow.scale = self.scales.count > index ? [[self.scales objectAtIndex:index] floatValue] : 1;
        [snows addObject:snow];
        index ++;
    }
    
    
    layer.emitterCells = snows;
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}

- (void)layoutSubviews
{
    [self setup];
    [super layoutSubviews];
}

- (CAEmitterCell*)cellAtIndexPath:(NSInteger)index
{
    CAEmitterLayer *layer = (CAEmitterLayer*)self.layer;
    return layer.emitterCells.count > index ? [layer.emitterCells objectAtIndex:index] : nil;
}

@end
