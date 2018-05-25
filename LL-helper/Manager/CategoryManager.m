//
//  CategoryManager.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/23.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "CategoryManager.h"

@implementation CategoryManager

+ (NSArray*)categoryLine1 {
    Category* c1 = [[Category alloc]initWithCategory:1 image:@"lipstick" name:@"口红"];
    Category* c2 = [[Category alloc]initWithCategory:2 image:@"mask" name:@"面膜"];
    Category* c3 = [[Category alloc]initWithCategory:3 image:@"perfume" name:@"眼部用品"];
    Category* c4 = [[Category alloc]initWithCategory:4 image:@"1" name:@"面部彩妆"];
    Category* c5 = [[Category alloc]initWithCategory:5 image:@"2" name:@"水乳/精华"];
    
    return @[c1,c2,c3,c4,c5];
}

+ (NSArray*)categoryLine2 {
    Category* c6 = [[Category alloc]initWithCategory:6 image:@"3" name:@"卸妆"];
    Category* c7 = [[Category alloc]initWithCategory:7 image:@"4" name:@"护手霜"];
    Category* c8 = [[Category alloc]initWithCategory:8 image:@"5" name:@"身体乳"];
    Category* c9 = [[Category alloc]initWithCategory:9 image:@"6" name:@"洗护"];
    Category* c10 = [[Category alloc]initWithCategory:10 image:@"7" name:@"其他"];
    
    return @[c6,c7,c8,c9,c10];
}

@end
