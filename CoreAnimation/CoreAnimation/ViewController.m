//
//  ViewController.m
//  CoreAnimation
//
//  Created by on 16/9/18.
//  Copyright © 2016年 fuugouryoku. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self basicAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)basicAnimation
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.toValue = @300;
    //设置时间曲线
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.duration = 5;
    
    //动画执行完删除动画
    animation.removedOnCompletion = YES;
    
    [view.layer addAnimation:animation forKey:@"CABasicAnimation"];
    
    
    
    
    
}



@end
