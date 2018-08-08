//
//  CategoryManager.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/23.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "CategoryManager.h"

@implementation CategoryManager


+ (NSArray *)categories {
    Category* c1 = [[Category alloc]initWithCategory:1 image:@"口红" name:@"口红"];
    Category* c2 = [[Category alloc]initWithCategory:2 image:@"洗面奶" name:@"洗面奶"];
    Category* c3 = [[Category alloc]initWithCategory:3 image:@"化妆水" name:@"化妆水"];
    Category* c4 = [[Category alloc]initWithCategory:4 image:@"睫毛膏" name:@"睫毛膏"];
    Category* c5 = [[Category alloc]initWithCategory:5 image:@"精华" name:@"精华"];
    Category* c6 = [[Category alloc]initWithCategory:6 image:@"精油" name:@"精油"];
    Category* c7 = [[Category alloc]initWithCategory:7 image:@"面膜" name:@"面膜"];
    Category* c8 = [[Category alloc]initWithCategory:8 image:@"气垫" name:@"气垫"];
    Category* c9 = [[Category alloc]initWithCategory:9 image:@"腮红" name:@"腮红"];
    Category* c10 = [[Category alloc]initWithCategory:10 image:@"洗发" name:@"洗发"];
    Category* c11 = [[Category alloc]initWithCategory:11 image:@"香水" name:@"香水"];
    Category* c12 = [[Category alloc]initWithCategory:12 image:@"眼影" name:@"眼影"];
    
    return @[c1,c2,c3,c4,c5, c6,c7,c8,c9,c10,c11,c12];
}

@end
