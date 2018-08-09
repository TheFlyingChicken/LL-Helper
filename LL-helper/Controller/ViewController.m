//
//  ViewController.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/22.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "ViewController.h"
#import "CircleLayout.h"
#import "CategoryCollectionCell.h"

@interface ViewController ()<LPDImagePickerControllerDelegate, LLCollectionViewDelegate>
@property (assign, nonatomic) CGFloat topMargin;
@property (strong, nonatomic) LLCollectionView *collectionView;
@property (strong, nonatomic) UIButton *uploadButton;
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.uploadButton];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(60);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(120);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
        make.height.mas_equalTo(CGRectGetWidth(self.view.frame));
    }];
    
    [_uploadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(90, 40));
    }];
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

- (void)didSelectItemAt:(NSIndexPath *)index entity:(id)entity {
    ListViewController *vc = [ListViewController new];
    vc.category = (LLCategory *)entity;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"胖胖管理系统";
        _titleLabel.font = [UIFont LLFontOfSize: 20];
        _titleLabel.textColor = [UIColor colorWithR:255 G:35 B:108];
    }
    return _titleLabel;
}

- (UIButton *)uploadButton {
    if (!_uploadButton) {
        _uploadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_uploadButton setTitle:@"上传新品" forState:UIControlStateNormal];
        [_uploadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _uploadButton.backgroundColor = [UIColor whiteColor];
        _uploadButton.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:0.8].CGColor;
        _uploadButton.layer.borderWidth = 0.8;
        [_uploadButton addTarget:self action:@selector(showUploadView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _uploadButton;
}

- (LLCollectionView *)collectionView {
    if (!_collectionView) {
        CircleLayout *layout = [CircleLayout new];
        _collectionView = [[LLCollectionView alloc]initWithLayout:layout];
        [_collectionView setData:[CategoryManager categories]];
        [_collectionView setDelegate:self];
        [_collectionView registerCell:NSStringFromClass([CategoryCollectionCell class])];
    }
    return _collectionView;
}

@end
