//
//  Brand.h
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/9.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLBrand : NSObject

@property (assign, nonatomic) NSInteger ID;
@property (assign, nonatomic) NSInteger categroyID;
@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger count;
@property (assign, nonatomic) BOOL status;

@property (strong, nonatomic) NSURL *imageUrl;


- (instancetype)initWith: (NSDictionary *)dic;

+ (NSArray<LLBrand *> *)modelsFromJSONArray:(id)array;

@end
