//
//  ViewController.m
//  PureApp
//
//  Created by 星风TB on 15/6/22.
//  Copyright (c) 2015年 星风. All rights reserved.
//

#import "ViewController.h"
#import "XFSnowView.h"

@interface ViewController ()

@property (nonatomic, strong) XFSnowView    *snowView;
@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) UISlider     *speedSlider;
@property (nonatomic, strong) UILabel       *speedLabel;

@property (nonatomic, strong) UISlider      *scaleSlider;
@property (nonatomic, strong) UILabel       *scaleLabel;

@property (nonatomic, weak)   CAEmitterCell *currentSnow;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _snowView = [[XFSnowView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400)];
    
    _snowView.snowImages = [NSMutableArray arrayWithArray:@[
                            [[UIImage imageNamed:@"snow1"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate],
                            [[UIImage imageNamed:@"snow2"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate],
                            [[UIImage imageNamed:@"snow3"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate],
                             ]];
    _snowView.velocitys = [NSMutableArray arrayWithArray:@[@(30),@(40),@(80)]];
    _snowView.birthRates = [NSMutableArray arrayWithArray:@[@(1),@(1),@(1)]];
    _snowView.scales = [NSMutableArray arrayWithArray:@[@(0.3),@(0.8),@(0.6)]];
    _snowView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_snowView];
    
    _segment = [[UISegmentedControl alloc] initWithItems:@[@"蓝色",@"黄色",@"红色"]];
    [_segment addTarget:self action:@selector(didSelectSnowAtIndexPath:) forControlEvents:UIControlEventValueChanged];
    _segment.frame = CGRectMake(10, 410, [UIScreen mainScreen].bounds.size.width-20, 20);
    _segment.selectedSegmentIndex = 0;
    
    [self.view addSubview:_segment];
    
    UILabel *speedTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 440, 60, 20)];
    speedTitleLabel.font = [UIFont systemFontOfSize:12.f];
    speedTitleLabel.text = @"下落速度:";
    [self.view addSubview:speedTitleLabel];
    
    _speedLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 70, 440, 60, 20)];
    _speedLabel.text = @"1/100";
    _speedLabel.font = [UIFont systemFontOfSize:12.f];
    [self.view addSubview:_speedLabel];
    
    _speedSlider = [[UISlider alloc] init];
    _speedSlider.frame = CGRectMake(80, 440, [UIScreen mainScreen].bounds.size.width - 160, 20);
    _speedSlider.minimumValue = 1;
    _speedSlider.maximumValue = 100;
    _speedSlider.continuous = NO;
    [_speedSlider addTarget:self action:@selector(snowSpeedDidChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_speedSlider];
    
    UILabel *scaleTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 470, [UIScreen mainScreen].bounds.size.width, 20)];
    scaleTitleLabel.text = @"缩放:";
    scaleTitleLabel.font = [UIFont systemFontOfSize:12.f];
    [self.view addSubview:scaleTitleLabel];
    
    _scaleLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 70, 470, 60, 20)];
    _scaleLabel.text = @"0/1";
    _scaleLabel.font = [UIFont systemFontOfSize:12.f];
    [self.view addSubview:_scaleLabel];
    
    _scaleSlider = [[UISlider alloc] init];
    _scaleSlider.frame = CGRectMake(80, 470, [UIScreen mainScreen].bounds.size.width - 160, 20);
    _scaleSlider.minimumValue = 0;
    _scaleSlider.maximumValue = 3;
    _scaleSlider.continuous = NO;
    [_scaleSlider addTarget:self action:@selector(snowScaleDidChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_scaleSlider];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadSettingForSnow:self.currentSnow];
}


- (void)loadSettingForSnow:(CAEmitterCell*)snow
{
    _speedSlider.value = snow.velocity;
    _scaleSlider.value = snow.scale;
    self.speedLabel.text = [NSString stringWithFormat:@"%.0f/%.0f",self.speedSlider.value,self.speedSlider.maximumValue];
    self.scaleLabel.text = [NSString stringWithFormat:@"%.2f/%.2f",self.scaleSlider.value,self.scaleSlider.maximumValue];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectSnowAtIndexPath:(UISegmentedControl*)segment
{
    self.currentSnow = [self.snowView cellAtIndexPath:segment.selectedSegmentIndex];
    [self loadSettingForSnow:self.currentSnow];
}

#pragma mark －滑动条

- (void)snowSpeedDidChanged:(UISlider*)slider
{
    [self.snowView.velocitys replaceObjectAtIndex:self.segment.selectedSegmentIndex withObject:@(slider.value)];
    self.speedLabel.text = [NSString stringWithFormat:@"%.0f/%.0f",slider.value,slider.maximumValue];
    [self.snowView layoutSubviews];
}

- (void)snowScaleDidChanged:(UISlider*)slider
{
    [self.snowView.scales replaceObjectAtIndex:self.segment.selectedSegmentIndex withObject:@(slider.value)];
    self.scaleLabel.text = [NSString stringWithFormat:@"%.2f/%.2f",slider.value,slider.maximumValue];
    [self.snowView layoutSubviews];
}

#pragma mark Property

- (CAEmitterCell*)currentSnow
{
    if (!_currentSnow) {
        _currentSnow = [self.snowView cellAtIndexPath:0];
    }
    return _currentSnow;
}

@end
