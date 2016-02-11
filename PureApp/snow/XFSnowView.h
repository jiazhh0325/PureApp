//
//  XFSnowView.h
//  PureApp
//
//  Created by 星风TB on 16/2/10.
//  Copyright © 2016年 星风. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFSnowView : UIView

@property(nonatomic, strong) NSMutableArray        *snowImages;
@property(nonatomic, strong) NSMutableArray        *velocitys;
@property(nonatomic, strong) NSMutableArray        *birthRates;
@property(nonatomic, strong) NSMutableArray         *scales;


- (CAEmitterCell*)cellAtIndexPath:(NSInteger)index;

@end
