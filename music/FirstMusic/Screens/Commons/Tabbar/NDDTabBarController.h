//
//  NDDTabBarController.h
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/19/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FMTabBar;

@protocol FMTabBarDelegate<NSObject>

@optional

- (void)tabBar:(FMTabBar *)tabBar didSelectItem:(UITabBarItem *)item;

@end

@interface FMTabBar : UIView

@property(nonatomic,assign) id<FMTabBarDelegate> delegate;
@property(nonatomic,strong) NSArray *items;
@property(nonatomic,weak) UITabBarItem *selectedItem;

@property(nonatomic,retain) IBInspectable UIColor *tintColor;
@property(nonatomic,retain) IBInspectable UIColor *tinSelectedColor;

@end

@interface NDDTabBarController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet FMTabBar *tabbar;
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic,readonly) BOOL hiddenTabbar;

- (void)setSelectedViewControllerIndex:(NSInteger)index;

- (void)hideTabbar:(BOOL) hidden withAnamiation:(BOOL) animation;

@end
