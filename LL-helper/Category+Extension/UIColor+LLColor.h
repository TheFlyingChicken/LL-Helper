//
//  UIColor+LLColor.h
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/8.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LLColor)

+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue;

+ (instancetype)colorWithHexString: (NSString *)color;

@end
