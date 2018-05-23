//
//  Category.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/23.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "Category.h"

@implementation Category

- (instancetype)initWithCategory:(NSInteger)id image:(NSString *)url name:(NSString *)name {
    self = [super init];
    
    if (self) {
        _id = id;
        _image_url = url;
        _name = name;
    }
    return self;
}

@end
