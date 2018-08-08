//
//  ListViewController.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/28.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "ListViewController.h"
#define HB_Color(r,g,b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]
@interface ListViewController ()
@property (strong, nonatomic) UIButton *btn_dismiss;
@property (strong, nonatomic) UILabel *lbl_title;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.btn_dismiss];
    [self.btn_dismiss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
    
    [self.view addSubview:self.lbl_title];
    [self.lbl_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.btn_dismiss);
        make.height.mas_equalTo(self.btn_dismiss);
        make.left.mas_equalTo(self.btn_dismiss.mas_right).offset(20);
    }];
}


#pragma mark - Action
- (void)actionDismiss {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Getter
- (UIButton *)btn_dismiss {
    if (!_btn_dismiss) {
        _btn_dismiss = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_dismiss setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_btn_dismiss addTarget:self action:@selector(actionDismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn_dismiss;
}

- (UILabel *)lbl_title {
    if (!_lbl_title) {
        _lbl_title = [UILabel new];
        _lbl_title.textAlignment = NSTextAlignmentCenter;
        _lbl_title.text = _category.name;
        _lbl_title.font = [UIFont fontWithName:@"FZSEJW--GB1-0" size:20];
        _lbl_title.textColor = HB_Color(236, 91, 49);
    }
    return _lbl_title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
