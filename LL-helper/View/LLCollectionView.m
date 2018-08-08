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

- (void)registerCell {//}:(LLBaseCollectionViewCell *)cellClass {
    [_collectionView registerClass:[BrandCollectionCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BrandCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    id entity = [self.dataArray objectAtIndex:indexPath.item];
    [cell setCellInfo:entity];
    return cell;
}

@end
