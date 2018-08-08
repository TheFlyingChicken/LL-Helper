//
//  LLCollectionView.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/8.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "LLCollectionView.h"

@interface LLCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) NSString *CellID;
@end

@implementation LLCollectionView

- (instancetype)initWithLayout: (UICollectionViewLayout *)layout
{
    self = [super init];
    if (self) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.scrollsToTop = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [self addSubview:_collectionView];
        
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self);
            make.left.mas_equalTo(self);
            make.right.mas_equalTo(self);
            make.bottom.mas_equalTo(self);
        }];
    }
    return self;
}

- (void)setData:(NSArray *)array {
    self.dataArray = array;
    [self.collectionView reloadData];
}


- (void)registerCell:(NSString *)cellClass {
    _CellID = cellClass;
    Class class = NSClassFromString(cellClass);
    [_collectionView registerClass:class forCellWithReuseIdentifier:_CellID];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LLBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_CellID forIndexPath:indexPath];
    id entity = [self.dataArray objectAtIndex:indexPath.item];
    [cell setCellInfo:entity];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(didSelectItemAt:entity:)]) {
        [self.delegate didSelectItemAt:indexPath entity:[self.dataArray objectAtIndex:indexPath.item]];
    }
}

@end
