//
//  CircleLayout.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/8.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "CircleLayout.h"

@interface CircleLayout()
@property (assign, nonatomic) CGFloat radius;
@property (assign, nonatomic) CGPoint center;
@property (assign, nonatomic) NSInteger count;
@property (strong, nonatomic) NSMutableArray *attributes;
@end

@implementation CircleLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    _count = [self.collectionView numberOfItemsInSection:0];
    _attributes = [NSMutableArray array];
    
    CGFloat width = CGRectGetWidth(self.collectionView.bounds);
    CGFloat height = CGRectGetHeight(self.collectionView.bounds);
    
    _center = CGPointMake(width*0.5, height*0.5);
    _radius = MIN(width, height)/3.0;
    
    for (NSInteger i = 0; i < _count; i++) {
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:index];
        
        [_attributes addObject:attr];
    }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(60, 60);
    
    CGFloat angle = 2 * M_PI * indexPath.row / _count;
    attributes.center = CGPointMake(_center.x + _radius*cos(angle), _center.y + _radius*sin(angle));
    return attributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributes;
}

- (CGSize)collectionViewContentSize {
    return self.collectionView.bounds.size;
}

@end
