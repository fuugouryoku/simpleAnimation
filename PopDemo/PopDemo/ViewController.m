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
    
    [view.layer pop_addAnimation:decayAnimation forKey:@"decayAnimation"];
    
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
