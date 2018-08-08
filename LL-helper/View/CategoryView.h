//
//  CategoryView.h
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/23.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"


@protocol CategoryDelegate<NSObject>
- (void)didSelectCategory: (Category *)category;

@end



@interface CategoryView : UIView

@property (weak, nonatomic) id<CategoryDelegate> delegate;

- (void)setInfo: (Category*)category;

@end
