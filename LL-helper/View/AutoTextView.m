//
//  AutoTextView.m
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/24.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import "AutoTextView.h"

@interface AutoTextView()
/**
 *  占位
 */
@property (strong, nonatomic)UITextView* placeholderView;
/**
 *  文字高度
 */
@property (nonatomic, assign) NSInteger textHeight;

/**
 *  文字最大高度
 */
@property (nonatomic, assign) NSInteger maxTextHeight;
@end

@implementation AutoTextView

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.textHeight = self.frame.size.height;
    
    self.scrollEnabled = NO;
    self.scrollsToTop = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.enablesReturnKeyAutomatically = YES;
    self.layer.borderWidth = 1;

    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
}

-(void)setMaxLineCount:(NSUInteger)maxLineCount {
    _maxLineCount = maxLineCount;
    
    _maxTextHeight = ceil(self.font.lineHeight * maxLineCount + self.textContainerInset.top + self.textContainerInset.bottom);
}

-(void)setTextViewBlock:(void (^)(NSString *, CGFloat))textViewBlock {
    _textViewBlock = textViewBlock;
    [self textDidChange];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.placeholderView.text = placeholder;
}

- (void)textDidChange
{
    self.placeholderView.hidden = self.text.length > 0;
    
    NSInteger height = ceilf([self sizeThatFits:CGSizeMake(self.bounds.size.width, MAXFLOAT)].height);
    
    if (height >= _textHeight) {
        // 最大高度，可以滚动
        self.scrollEnabled = height > _maxTextHeight && _maxTextHeight > 0;
        
        _textHeight = height;
        if (_textViewBlock && self.scrollEnabled == NO) {
            _textViewBlock(self.text, height);
            [self.superview layoutIfNeeded];
            self.placeholderView.frame = self.bounds;
        }
    }
}

- (UITextView *)placeholderView
{
    if (_placeholderView == nil) {
        UITextView *placeholderView = [[UITextView alloc]initWithFrame:self.frame];
        _placeholderView = placeholderView;
        _placeholderView.scrollEnabled = NO;
        _placeholderView.showsHorizontalScrollIndicator = NO;
        _placeholderView.showsVerticalScrollIndicator = NO;
        _placeholderView.userInteractionEnabled = NO;
        _placeholderView.font = self.font;
        _placeholderView.textColor = [UIColor lightGrayColor];
        _placeholderView.backgroundColor = [UIColor clearColor];
        [self addSubview:placeholderView];
    }
    return _placeholderView;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
