//
//  ViewController.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/22.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <LPDQuoteImagesView.h>

@interface ViewController ()<LPDImagePickerControllerDelegate>
@property (assign, nonatomic) CGFloat topMargin;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self iconLine1];
    [self iconLine2];
    [self uploadButton];
}

- (void)showUploadView {
    LPDImagePickerController *pickerVC = [[LPDImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    pickerVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    pickerVC.allowPickingVideo = NO;
    pickerVC.allowPickingOriginalPhoto = NO;
    pickerVC.sortAscendingByModificationDate = NO;

    UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"UploadViewController"];
    pickerVC.modaledVC = vc;
    
    [self presentViewController:pickerVC animated:YES completion:nil];
}

- (void)uploadButton {
    UIButton* upload = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:upload];
    
    [upload mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-50);
        make.size.mas_equalTo(CGSizeMake(130, 40));
    }];
    [self.view layoutIfNeeded];
    
    [upload setTitle:@"上传新品" forState:UIControlStateNormal];
    [upload setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    upload.backgroundColor = [UIColor whiteColor];
    upload.layer.masksToBounds = true;
    upload.layer.cornerRadius = upload.frame.size.height/2;
    upload.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:0.8].CGColor;
    upload.layer.borderWidth = 0.8;
    [upload addTarget:self action:@selector(showUploadView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)iconLine1 {
    NSArray* list = [CategoryManager categoryLine1];
    NSArray* array = [self getGategoryViews:list];
    
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(60);
    }];
    [self.view layoutIfNeeded];
    UIView* view = [array firstObject];
    _topMargin = view.frame.size.height + 60;
}

- (void)iconLine2 {
    NSArray* list = [CategoryManager categoryLine2];
    NSArray* array = [self getGategoryViews:list];

    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(_topMargin);
    }];
    [self.view layoutIfNeeded];
    UIView* view = [array firstObject];
    _topMargin += view.frame.size.height;
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
