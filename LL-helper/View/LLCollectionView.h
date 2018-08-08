//
//  LLCollectionView.h
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/8.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseCollectionViewCell.h"

@interface LLCollectionView : UIView

- (instancetype)initWithLayout: (UICollectionViewLayout *)layout;

- (void)setData: (NSArray *)array;
//- (void)registerCell: (Class *)cellClass;
- (void)registerCell;
@end
