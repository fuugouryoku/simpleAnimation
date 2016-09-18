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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//关键帧动画，将动画中指定的帧作为节点，由core animation自动补全动画
-(void)keyframeAnimation
{
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 200, 40)];
    textField.secureTextEntry = YES;
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth =1;
    [self.view addSubview:textField];
    
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animation];
    
    
}

-(void)basicAnimation
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:view];
    view.tag = 100;
    view.backgroundColor = [UIColor redColor];
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    
    animation.toValue = @300;
    //设置时间曲线
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.duration = 5;
    
//    animation.repeatCount = CGFLOAT_MAX;
    //动画执行完删除动画
//    animation.removedOnCompletion = NO;
//    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeBackwards;
    
 //未动画设置代理
    animation.delegate = self;
    [view.layer addAnimation:animation forKey:@"CABasicAnimation"];
}

#pragma -动画代理方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    UIView *basicAnimationView = [self.view viewWithTag:100];
    basicAnimationView.layer.backgroundColor = [UIColor greenColor].CGColor ;
}


@end
