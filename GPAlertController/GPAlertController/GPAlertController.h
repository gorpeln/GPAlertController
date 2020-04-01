//
//  GPAlertController.h
//  GPAlertController
//
//  Created by chen on 2018/7/19.
//  Copyright © 2018年 gorpeln. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define DefaultTitleTextColor              [UIColor blackColor]
#define DefaultMessageTextColor            [UIColor blackColor]
#define DefaultTitleTextFont               [UIFont boldSystemFontOfSize:14.0]
#define DefaultMessageTextFont             [UIFont systemFontOfSize:14.0]

@class GPAlertController;
/**
 GPAlertController: alertAction配置链
 */
typedef GPAlertController * _Nonnull (^GPAlertAction)(NSString *title);
typedef GPAlertController * _Nonnull (^GPAlertCustomAction)(NSString *title,UIColor *titleColor);
/**
 GPAlertController: alert构造块
 @param alertMaker GPAlertController配置对象
 */
typedef void(^GPAlertAppearanceProcess)(GPAlertController *alertMaker);

/**
 GPAlertController: alert按钮执行回调
 @param buttonIndex 按钮index(根据添加action的顺序)
 @param action      UIAlertAction对象
 @param alertSelf   本类对象
 */
typedef void (^GPAlertActionBlock)(NSInteger buttonIndex, UIAlertAction *action, GPAlertController *alertSelf);

@interface GPAlertController : UIAlertController
/**
 GPAlertController: 禁用alert弹出动画，默认执行系统的默认弹出动画
 */
- (void)alertAnimateDisabled;
/**
 GPAlertController: alert弹出后，可配置的回调
 */
@property (nullable, nonatomic, copy) void (^alertDidShow)(void);

/**
 GPAlertController: alert关闭后，可配置的回调
 */
@property (nullable, nonatomic, copy) void (^alertDidDismiss)(void);

/**
 GPAlertController: 设置toast模式展示时间：如果alert未添加任何按钮，将会以toast样式展示，这里设置展示时间，默认1s
 */
@property (nonatomic, assign) NSTimeInterval toastStyleDuration; //deafult alertShowDurationDefault = 1s

- (GPAlertAction)addDefaultAction;

- (GPAlertCustomAction)addAttributedAction;

- (GPAlertAction)addCancelAction;

- (GPAlertAction)addDestructiveAction;

/**
 GPAlertController: show-alert
 @param title             title
 @param message           message
 @param appearanceProcess alert配置过程
 @param actionBlock       alert点击响应回调
 */
+ (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
         appearanceProcess:(GPAlertAppearanceProcess)appearanceProcess
              actionsBlock:(nullable GPAlertActionBlock)actionBlock;
/**
 GPAlertController: show-actionSheet
 @param title             title
 @param message           message
 @param appearanceProcess actionSheet配置过程
 @param actionBlock       actionSheet点击响应回调
 */
+ (void)showActionSheetWithTitle:(nullable NSString *)title
                         message:(nullable NSString *)message
               appearanceProcess:(GPAlertAppearanceProcess)appearanceProcess
                    actionsBlock:(nullable GPAlertActionBlock)actionBlock;
@end

 
@interface UIAlertController (Color)

@property (nonatomic,strong) UIColor *titleColor; /**< 标题的颜色 */
@property (nonatomic,strong) UIColor *messageColor; /**< 信息的颜色 */

@property (nonatomic,strong) UIFont *titleFont; /**< 标题的字体 */
@property (nonatomic,strong) UIFont *messageFont; /**< 信息的字体 */

NS_ASSUME_NONNULL_END

@end

