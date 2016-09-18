//
//  TableViewCell.m
//  PopDemo
//
//  Created by 千锋 on 16/9/18.
//  Copyright © 2016年 fuugouryoku. All rights reserved.
//

#import "TableViewCell.h"
#import <POP.h>
@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if (highlighted) {
        //放大
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed: kPOPViewScaleXY];
        scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.2, 1.2)];
        scaleAnimation.duration = 0.1;
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
    }else{
        //弹簧效果
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
        //弹簧初始速度
        springAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        //递减速度.弹力，震动幅度
        springAnimation.springBounciness = 20;
        [self.textLabel pop_addAnimation:springAnimation forKey:@"springAnimation"];
        
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
