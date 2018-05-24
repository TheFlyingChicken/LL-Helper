//
//  UploadViewController.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/23.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "UploadViewController.h"
#import "LPDQuoteImagesView.h"
#import "AutoTextView.h"

@interface UploadViewController ()<LPDQuoteImagesViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeight;
@property (weak, nonatomic) IBOutlet AutoTextView* textview;

@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textview.placeholder = @"输入";
    _textview.maxLineCount = 12;
    _textview.textViewBlock = ^(NSString *text,CGFloat height){
        _textViewHeight.constant = height;
    };
    
    
    [self imageArea];
}

- (IBAction)upload:(id)sender {
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)imageArea {
    CGFloat screenWidth = [[UIScreen mainScreen]bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen]bounds].size.height;
    
    LPDQuoteImagesView *imageArea =[[LPDQuoteImagesView alloc] initWithFrame:CGRectMake(20, screenHeight-(screenWidth-40)-10, screenWidth - 40, screenWidth-40) withCountPerRowInView:3 cellMargin:12];

    imageArea.maxSelectedCount = 9;
    imageArea.collectionView.scrollEnabled = NO;
    imageArea.navcDelegate = self;
    [self.scrollView addSubview:imageArea];
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
