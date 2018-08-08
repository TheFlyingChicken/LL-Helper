//
//  LLCollectionView.h
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/8.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseCollectionViewCell.h"

@protocol LLCollectionViewDelegate<NSObject>
- (void)didSelectItemAt: (NSIndexPath *)index entity: (id)entity;

@end

@interface LLCollectionView : UIView

@property (weak, nonatomic) id<LLCollectionViewDelegate> delegate;

- (instancetype)initWithLayout: (UICollectionViewLayout *)layout;

- (void)setData: (NSArray *)array;
- (void)registerCell: (NSString *)cellClass;

@end
