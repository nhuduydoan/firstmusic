//
//  NDDTabBarController.h
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/19/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NDDTabBar;

@protocol NDDTabBarDelegate<NSObject>

@optional

- (void)tabBar:(NDDTabBar *)tabBar didSelectItem:(UITabBarItem *)item;

@end

@interface NDDTabBar : UIView

@property(nonatomic,assign) id<NDDTabBarDelegate> delegate;
@property(nonatomic,strong) NSArray *items;
@property(nonatomic,weak) UITabBarItem *selectedItem;

@property(nonatomic,retain) IBInspectable UIColor *tinSelectedColor;
@property(nonatomic,retain) IBInspectable UIColor *backgroungSelectedColor;
@property (nonatomic, retain) IBInspectable UIColor *lineItemColor;

@end

@interface NDDTabBarController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NDDTabBar *tabbar;
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic,readonly) BOOL hiddenTabbar;

- (void)setSelectedViewControllerIndex:(NSInteger)index;
- (void)hideTabbar:(BOOL) hidden withAnamiation:(BOOL) animation;

@end
