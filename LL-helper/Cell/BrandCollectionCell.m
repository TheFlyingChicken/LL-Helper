//
//  BrandCollectionCell.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/8/8.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "BrandCollectionCell.h"


@interface BrandCollectionCell()
@property (strong, nonatomic) UILabel *lbl_title;
@end

@implementation BrandCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lbl_title];
        
        self.backgroundColor = [UIColor colorWithHexString:@"EEDFCC"];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.lbl_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
    }];
 }

- (void)setCellInfo:(id)entity {
    NSLog(@"%@", entity);
    
    NSString *num = (NSString *)entity;
    self.lbl_title.text = num;
}

- (UILabel *)lbl_title {
    if (!_lbl_title) {
        _lbl_title = [UILabel new];
        _lbl_title.textAlignment = NSTextAlignmentCenter;
        _lbl_title.textColor = [UIColor blackColor];
        _lbl_title.font = [UIFont systemFontOfSize:18];
        _lbl_title.backgroundColor = [UIColor clearColor];
        _lbl_title.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _lbl_title;
}

@end
