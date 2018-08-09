//
//  LLCategory.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/9.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "LLCategory.h"

@implementation LLCategory

- (instancetype)initWithCategory:(NSInteger)ID image:(NSString *)url name:(NSString *)name {
    self = [super init];
    
    if (self) {
        self.ID = ID;
        self.image_url = url;
        self.name = name;
    }
    return self;
}

@end
