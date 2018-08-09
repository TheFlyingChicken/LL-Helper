
//
//  Brand.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/9.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "LLBrand.h"

@implementation LLBrand

- (instancetype)initWith: (NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.ID = [dic[@"id"] integerValue];
        self.categroyID = [dic[@"category_id"] integerValue];
        self.name = dic[@"name"];
        self.imageString = dic[@"image_url"];
        self.count = [dic[@"count"] integerValue];
        self.status = [dic[@"status"] boolValue];
    }
    return self;
}

+ (NSArray<LLBrand *> *)modelsFromJSONArray:(id)array {
    [LLBrand mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID": @"id",
                 @"categroyID": @"category_id",
                 @"imageString": @"image_url"
                 };
    }];
    
    return [LLBrand mj_objectArrayWithKeyValuesArray:array];
}


- (NSURL *)imageUrl {
    return [NSURL URLWithString:self.imageString];
}
@end
