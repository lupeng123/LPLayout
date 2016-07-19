//
//  LPCell.m
//  collection动画练习
//
//  Created by iOS on 16/7/5.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "LPCell.h"

@implementation LPCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lab.layer.cornerRadius = 10;
    self.lab.layer.masksToBounds = YES;
}

@end
