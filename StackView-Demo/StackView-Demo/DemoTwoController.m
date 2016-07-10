//
//  ViewController.m
//  StackView-Demo
//
//  Created by sharejoy_lx on 16-07-10.
//  Copyright © 2016年 shangbin. All rights reserved.
//

#import "DemoTwoController.h"
#import "Masonry.h"

#define RadomColor [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1]

@interface DemoTwoController ()

@property (nonatomic, strong) UIStackView *horizontalView;
@property (nonatomic, strong) UIStackView *verticalView;

@end

@implementation DemoTwoController

- (UIStackView *)horizontalView
{
    if (!_horizontalView) {
        _horizontalView = [[UIStackView alloc] init];
        _horizontalView.axis = UILayoutConstraintAxisHorizontal;
        _horizontalView.distribution = UIStackViewDistributionFillEqually;
        _horizontalView.spacing = 10;
        _horizontalView.alignment = UIStackViewAlignmentFill;
        
    }
    return _horizontalView;
}

- (UIStackView *)verticalView
{
    if (!_verticalView) {
        _verticalView = [[UIStackView alloc] init];
        _verticalView.axis = UILayoutConstraintAxisVertical;
        _verticalView.distribution = UIStackViewDistributionFillEqually;
        _verticalView.spacing = 10;
        _verticalView.alignment = UIStackViewAlignmentFill;

    }
    return _verticalView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.verticalView];
    
    [self.verticalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 50, 0));
    }];
    
    [self addClickEvent];
    
    
}

- (void)addClickEvent {
    UIButton *addHorizontalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addHorizontalBtn setTitle:@"横行增加" forState:UIControlStateNormal];
    [addHorizontalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    addHorizontalBtn.frame = CGRectMake(0, 350, 100, 50);
    [addHorizontalBtn addTarget:self action:@selector(addHorizontalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addHorizontalBtn];
    
    UIButton *removeHorizontalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeHorizontalBtn setTitle:@"横行减少" forState:UIControlStateNormal];
    [removeHorizontalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    removeHorizontalBtn.frame = CGRectMake(0, 400, 100, 50);
    [removeHorizontalBtn addTarget:self action:@selector(removeHorizontalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeHorizontalBtn];
    
    UIButton *addVerticalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addVerticalBtn setTitle:@"纵行增加" forState:UIControlStateNormal];
    [addVerticalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    addVerticalBtn.frame = CGRectMake(0, 450, 100, 50);
    [addVerticalBtn addTarget:self action:@selector(addVerticalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addVerticalBtn];
    
    UIButton *removeVerticalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeVerticalBtn setTitle:@"纵行减少" forState:UIControlStateNormal];
    [removeVerticalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    removeVerticalBtn.frame = CGRectMake(0, 500, 100, 50);
    [removeVerticalBtn addTarget:self action:@selector(removeVerticalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeVerticalBtn];
}

- (void)addHorizontalClick {
    if (!_horizontalView) {
        [self.verticalView addArrangedSubview:self.horizontalView];
    }
    
    UIImageView *imgView = [self getDigimon];
    [self.horizontalView addArrangedSubview:imgView];
    
    [UIView animateWithDuration:1.0 animations:^{
        
        [self.horizontalView layoutIfNeeded];
    }];
    
}

- (void)removeHorizontalClick {
    if (!_horizontalView) return;
    UIView *view = [self.horizontalView subviews].lastObject;
    if (!view) return;
    
    [self.horizontalView removeArrangedSubview:view];
    [view removeFromSuperview];
    view = nil;
    [UIView animateWithDuration:0.25 animations:^{
        [self.horizontalView layoutIfNeeded];
    }];
}


- (void)addVerticalClick {
    UIImageView *imgView = [self getDigimon];
    [self.verticalView insertArrangedSubview:imgView atIndex:0];
    [UIView animateWithDuration:0.25 animations:^{
        [self.verticalView layoutIfNeeded];
    }];
}

- (void)removeVerticalClick {
    if (!_verticalView) return;
    UIView *view = [self.verticalView subviews].lastObject;
    if (!view) return;
    if ([view isKindOfClass:[UIStackView class]]) {
        _horizontalView = nil;
    }
    [self.verticalView removeArrangedSubview:view];
    [view removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        [self.verticalView layoutIfNeeded];
    }];
}

- (UIImageView *)getDigimon {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    NSString *imgName = [NSString stringWithFormat:@"222_%zd.jpg",random()%16+1];
    imgView.image = [UIImage imageNamed:imgName];
    return imgView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
