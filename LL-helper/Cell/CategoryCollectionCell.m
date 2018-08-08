//
//  CategoryCollectionCell.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/8.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "CategoryCollectionCell.h"


@interface CategoryCollectionCell()
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *lbl_title;

@property (strong, nonatomic) Category *category;
@end


@implementation CategoryCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.lbl_title];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.height.mas_equalTo(_imageView.mas_width);
    }];
    
    [self.lbl_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
    }];
}

#pragma mark - Action
- (void)setCellInfo:(id)entity {
    _category = (Category *)entity;
    [self.imageView setImage:[UIImage imageNamed:_category.image_url]];
    self.lbl_title.text = _category.name;
}

#pragma mark - Getter
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UILabel *)lbl_title {
    if (!_lbl_title) {
        _lbl_title = [UILabel new];
        _lbl_title.textAlignment = NSTextAlignmentCenter;
        _lbl_title.textColor = [UIColor blackColor];
        _lbl_title.font = [UIFont systemFontOfSize:15];
    }
    return _lbl_title;
}
@end
