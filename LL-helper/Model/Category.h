//
//  Category.h
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/23.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject

@property (assign, nonatomic) NSInteger id;
@property (copy, nonatomic) NSString* image_url;
@property (copy, nonatomic) NSString* name;

- (instancetype)initWithCategory:(NSInteger)id image: (NSString*)url name: (NSString*)name;

@end
