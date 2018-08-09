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
    LLCategory* c1 = [[LLCategory alloc]initWithCategory:1 image:@"口红" name:@"口红"];
    LLCategory* c2 = [[LLCategory alloc]initWithCategory:2 image:@"洗面奶" name:@"洗面奶"];
    LLCategory* c3 = [[LLCategory alloc]initWithCategory:3 image:@"化妆水" name:@"化妆水"];
    LLCategory* c4 = [[LLCategory alloc]initWithCategory:4 image:@"睫毛膏" name:@"睫毛膏"];
    LLCategory* c5 = [[LLCategory alloc]initWithCategory:5 image:@"精华" name:@"精华"];
    LLCategory* c6 = [[LLCategory alloc]initWithCategory:6 image:@"精油" name:@"精油"];
    LLCategory* c7 = [[LLCategory alloc]initWithCategory:7 image:@"面膜" name:@"面膜"];
    LLCategory* c8 = [[LLCategory alloc]initWithCategory:8 image:@"气垫" name:@"气垫"];
    LLCategory* c9 = [[LLCategory alloc]initWithCategory:9 image:@"腮红" name:@"腮红"];
    LLCategory* c10 = [[LLCategory alloc]initWithCategory:10 image:@"洗发" name:@"洗发"];
    LLCategory* c11 = [[LLCategory alloc]initWithCategory:11 image:@"香水" name:@"香水"];
    LLCategory* c12 = [[LLCategory alloc]initWithCategory:12 image:@"眼影" name:@"眼影"];
    
    return @[c1,c2,c3,c4,c5, c6,c7,c8,c9,c10,c11,c12];
}

@end
