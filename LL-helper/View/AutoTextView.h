//
//  AutoTextView.h
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/24.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoTextView : UITextView

@property (assign, nonatomic) NSUInteger maxLineCount;

@property (strong, nonatomic) void(^textViewBlock)(NSString *text,CGFloat height);

@property (copy, nonatomic) NSString* placeholder;

@end
