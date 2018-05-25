//
//  UploadViewController.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/23.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "UploadViewController.h"
#import <LPDQuoteImagesView/LPDQuoteImagesView.h>

@interface UploadViewController ()<LPDQuoteImagesViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeight;
@property (weak, nonatomic) IBOutlet AutoTextView* textview;
@property (strong, nonatomic) LPDQuoteImagesView *imageArea;
@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textview.placeholder = @"输入";
    _textview.maxLineCount = 12;
    _textview.textViewBlock = ^(NSString *text,CGFloat height){
        _textViewHeight.constant = height;
    };
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setupSelectedPhotos:) name:@"SelectedPhotosAndAssets" object:nil];
    
    [self setupImageArea];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"SelectedPhotosAndAssets" object:nil];
}

- (IBAction)upload:(id)sender {
}

- (IBAction)dismiss:(id)sender {
    UIViewController * presentingViewController = self.presentingViewController;
    do {
        if ([presentingViewController isKindOfClass:[ViewController class]]) {
            break;
        }
        presentingViewController = presentingViewController.presentingViewController;
        
    } while (presentingViewController.presentingViewController);
    
    [presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupImageArea {
    CGFloat screenWidth = [[UIScreen mainScreen]bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen]bounds].size.height;
    
    _imageArea =[[LPDQuoteImagesView alloc] initWithFrame:CGRectMake(20, screenHeight-(screenWidth-40)-10, screenWidth - 40, screenWidth-40) withCountPerRowInView:3 cellMargin:12];
    
    _imageArea.maxSelectedCount = 9;
    _imageArea.collectionView.scrollEnabled = NO;
    _imageArea.navcDelegate = self;
    [self.scrollView addSubview:_imageArea];
}

- (void)setupSelectedPhotos: (nullable NSNotification *)noti {
    NSDictionary *info = [noti userInfo];
    
    NSMutableArray *assets = info[@"assets"];
    NSMutableArray *photos = info[@"photos"];

    _imageArea.selectedPhotos = photos;
    _imageArea.selectedAssets = assets;
    [_imageArea.collectionView reloadData];
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
