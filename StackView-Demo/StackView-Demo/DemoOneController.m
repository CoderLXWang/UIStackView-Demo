//
//  DemoOneController.m
//  StackView-Demo
//
//  Created by sharejoy_lx on 16-07-10.
//  Copyright © 2016年 shangbin. All rights reserved.
//

#import "DemoOneController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface DemoOneController ()

@end

@implementation DemoOneController
{
    UIStackView *containerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    containerView = [[UIStackView alloc] init];
    containerView.backgroundColor = [UIColor orangeColor];
    
    //子控件的布局方向
    containerView.axis = UILayoutConstraintAxisHorizontal;
    
    /**  UIStackViewDistribution
     
     UIStackViewDistributionFill = 0,
     UIStackViewDistributionFillEqually,
     UIStackViewDistributionFillProportionally,
     UIStackViewDistributionEqualSpacing,
     UIStackViewDistributionEqualCentering,
     */
    containerView.distribution = UIStackViewDistributionFill;
    
    containerView.spacing = 10;
    
    /**  UIStackViewAlignment
     
     UIStackViewAlignmentFill,
     UIStackViewAlignmentLeading,
     UIStackViewAlignmentTop = UIStackViewAlignmentLeading,
     UIStackViewAlignmentFirstBaseline,
     UIStackViewAlignmentCenter,
     UIStackViewAlignmentTrailing,
     UIStackViewAlignmentBottom = UIStackViewAlignmentTrailing,
     UIStackViewAlignmentLastBaseline,
     */
    
    containerView.alignment = UIStackViewAlignmentFill;
    
    containerView.frame = CGRectMake(0, 100, ScreenWidth, 200);
    
    [self.view addSubview:containerView];
    
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"加一个Label" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    addBtn.frame = CGRectMake(50, 400, 100, 50);
    [addBtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    UIButton *removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeBtn setTitle:@"减一个Label" forState:UIControlStateNormal];
    [removeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    removeBtn.frame = CGRectMake(200, 400, 100, 50);
    [removeBtn addTarget:self action:@selector(removeClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeBtn];
}

- (void)addClick {
    NSLog(@"添加之前 : %zd",containerView.subviews.count);
    
    UILabel *view = [[UILabel alloc] init];
    view.textAlignment = NSTextAlignmentCenter;
    NSMutableString *str = [NSMutableString stringWithString:@"测试"];
    for (NSInteger i = 0; i < random()%4; i++) {
        [str appendString:@"测试"];
    }
    view.text = str;
    view.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
    [containerView addArrangedSubview:view];
    [UIView animateWithDuration:1.0 animations:^{
        
        [containerView layoutIfNeeded];
    }];
    
    NSLog(@"添加之后 : %zd",containerView.subviews.count);
    
}

- (void)removeClick {
    NSLog(@"移除之前 : %zd",containerView.subviews.count);
    
    UIView *view = [containerView subviews].lastObject;
    [containerView removeArrangedSubview:view];
    [view removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        
        [containerView layoutIfNeeded];
    }];
    NSLog(@"移除之后 : %zd",containerView.subviews.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
