//
//  CategoryView.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/23.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "CategoryView.h"

@interface CategoryView()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) Category *category;
@end

@implementation CategoryView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped)];
    [self addGestureRecognizer:tapG];
}

-(void)setInfo:(Category *)category {
    UIImage* img = [UIImage imageNamed:category.image_url];
    [_iconImageView setImage: img];
    _nameLabel.text = category.name;
    _category = category;
}

- (void)tapped {
    if ([self.delegate respondsToSelector:@selector(didSelectCategory:)]) {
        [self.delegate didSelectCategory:_category];
    }
}

@end
