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

       [self animationGroup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//关键帧动画，将动画中指定的帧作为节点，由core animation自动补全动画

-(void)keyframeAnimationRound
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 42, 81)];
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"satellite"];
    
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 100, 250, 250)];
    keyframeAnimation.path = bezierPath.CGPath;
    keyframeAnimation.duration = 4;
    keyframeAnimation.additive = YES;
    //重复次数无穷
    keyframeAnimation.repeatDuration = HUGE_VALF;
    keyframeAnimation.calculationMode = kCAAnimationPaced;
    //自选转
    keyframeAnimation.rotationMode = kCAAnimationRotateAuto;
    
    [imageView.layer addAnimation:keyframeAnimation forKey:@"keyframeAnimationRound"];
}

-(void)keyframeAnimation
{
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(25.5, 15.5)];
    [bezierPath addCurveToPoint: CGPointMake(25.5, 82.5) controlPoint1: CGPointMake(224.5, 26.5) controlPoint2: CGPointMake(25.5, 82.5)];

    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 200, 40)];
    textField.secureTextEntry = YES;
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth =1;
    [self.view addSubview:textField];
    
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    keyframeAnimation.values = @[@0,@10,@-10,@10,@0];
    keyframeAnimation.repeatDuration = 3;
//    keyframeAnimation.keyTimes = @[@0,@(1/6.0),@(2/6.0),@(3/6.0),@(4/6.0)];
    
    keyframeAnimation.path = bezierPath.CGPath;
    
    keyframeAnimation.duration = (3/6.0);
    //设置动画可添加
    keyframeAnimation.additive = YES;
    [textField.layer addAnimation:keyframeAnimation forKey:@"CAKeyframeAnimation"];

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

-(void)animationGroup
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 100)];
    basicAnimation.duration =1;
    basicAnimation.autoreverses =YES;
     CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    keyframeAnimation.values = @[@0,@(0.8),@0];
    keyframeAnimation.duration = 2;
    
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 2;
    animationGroup.animations = @[basicAnimation,keyframeAnimation];
    animationGroup.repeatCount = HUGE_VALF;
    [view.layer addAnimation:animationGroup forKey:@"CAAnimationGroup"];
    
    //在动画组中，动画开始时间为相对时间，添加到layer上的动画的开始时间为绝对时间，需要CACurrentMediaTime获取当前时间
}



#pragma -动画代理方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    UIView *basicAnimationView = [self.view viewWithTag:100];
    basicAnimationView.layer.backgroundColor = [UIColor greenColor].CGColor ;
}



@end
