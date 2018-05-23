//
//  ViewController.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/22.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "ViewController.h"
#import "Category.h"
#import <Masonry.h>
#import "CategoryView.h"
#import "CategoryManager.h"

@interface ViewController ()
@property (assign, nonatomic) CGFloat iconHeight;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self addIconLine1];
    [self addIconLine2];
}

- (void)addIconLine1 {
    NSArray* list = [CategoryManager categoryLine1];
    NSArray* array = [self getGategoryViews:list];
    
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(60);
    }];
    [self.view layoutIfNeeded];
    UIView* view = [array firstObject];
    _iconHeight = view.frame.size.height;
}

- (void)addIconLine2 {
    NSArray* list = [CategoryManager categoryLine2];
    NSArray* array = [self getGategoryViews:list];

    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(_iconHeight+60);
    }];
}

- (NSArray*)getGategoryViews: (NSArray*)list{
    NSMutableArray* array = [NSMutableArray new];
    for (Category* item in list) {
        CategoryView* view = [[[NSBundle mainBundle]loadNibNamed:@"CategoryView" owner:self options:nil]firstObject];
        [self.view addSubview:view];
        [view setInfo:item];
        [array addObject:view];
    }
    return array;
}
@end
