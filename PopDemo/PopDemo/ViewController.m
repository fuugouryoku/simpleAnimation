//
//  ViewController.m
//  PopDemo
//
//  Created by  on 16/9/18.
//  Copyright © 2016年 fuugouryoku. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import <POP.h>
@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self decayAnimation];
    [self creatTimer];
}

//阻尼效果
-(void)decayAnimation
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    
    POPDecayAnimation *decayAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    //初始值
    decayAnimation.velocity = @400;
    //衰减系数：值越小衰减越快
//    decayAnimation.deceleration = 0.998;
    
    
    [view.layer pop_addAnimation:decayAnimation forKey:@"decayAnimation"];
    
}

-(void)creatTimer
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 300, 200, 50)];
    [self.view addSubview:label];
    label.text = @"00:00:000";
    
    
    POPAnimatableProperty *customAnimation = [POPAnimatableProperty propertyWithName:@"foo" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.writeBlock = ^(id obj, const CGFloat values[]){
            label.text = [NSString stringWithFormat:@"%02ld:%02ld:%ld",(NSInteger) (values[0]/60),((NSInteger)(values[0])%60),(NSInteger)(values[0] * 100.0) % 100];
        
            
        };
        //设置刷新频率
        prop.threshold = 1.0f;
    }];
    POPBasicAnimation *linearAnimation = [POPBasicAnimation linearAnimation];
    linearAnimation.property = customAnimation;
    linearAnimation.fromValue = @0;
    linearAnimation.toValue = @(3*60);
    linearAnimation.duration = (3*60);
    //开始时间
    linearAnimation.beginTime = CACurrentMediaTime() + 1.0;
    [label pop_addAnimation:linearAnimation forKey:@"linearAnimation"];
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    cell.textLabel.text = @"asdsadasdasdsad";
    return cell;
}

@end
