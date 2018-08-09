//
//  LLCategory.h
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/9.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLCategory : NSObject

@property (assign, nonatomic) NSInteger ID;
@property (copy, nonatomic) NSString* image_url;
@property (copy, nonatomic) NSString* name;

- (instancetype)initWithCategory:(NSInteger)ID image: (NSString*)url name: (NSString*)name;


@end
