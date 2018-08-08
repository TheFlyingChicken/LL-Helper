//
//  AppDelegate.h
//  LL-helper
//
//  Created by 李耀宗 on 2018/5/22.
//  Copyright © 2018年 LYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

