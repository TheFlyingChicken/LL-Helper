//
//  UIColor+LLColor.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/8.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "UIColor+LLColor.h"

@implementation UIColor (LLColor)


+ (instancetype)LLColorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1];
}



@end
