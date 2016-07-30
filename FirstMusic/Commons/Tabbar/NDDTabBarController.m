//
//  NDDTabBarController.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/19/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "NDDTabBarController.h"
#import "NDDTabbarItem.h"
#import "FMGoogleAds.h"

#if kEMUsingTabBar
#import <UIViewController+ECSlidingViewController.h>
#endif

@interface UIViewController (GetMiniViewController)
@end


@interface NDDTabBar()<NDDTabbarItemDelegate>

@property (nonatomic, strong) NSMutableArray *arrayButton;
@property (nonatomic, strong) UIView *topLineView;

@end

@implementation NDDTabBar

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        [self setUpTabBarView];
    }
    
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self setUpTabBarView];
    }
    
    return self;
}

- (void) didMoveToWindow {
    
    [super didMoveToWindow];
    [self redraw];
    
    if (!self.selectedItem) {
        
        [self setSelectedItem:[self.items firstObject]];
        
    } else {
        
        [self setSelectedItem:self.selectedItem];
    }
}

- (void) layoutSubviews {
    
    [super layoutSubviews];
    [self updateLayout];
    
}

- (void) setUpTabBarView {
    
    // First Init color for view
    // Please setup on NDDTabBarController's viewDidLoad function to change
    self.tinSelectedColor = [UIColor redColor];
    self.backgroungSelectedColor = [UIColor blueColor];
    self.lineItemColor = [UIColor clearColor];
    
    self.topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5f)];
    self.topLineView.userInteractionEnabled = NO;
    self.topLineView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.topLineView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.topLineView];
}

- (void) redraw {
    
    NSUInteger itemCount = self.items.count;
    [self.arrayButton makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (self.arrayButton) {
        
        [self.arrayButton removeAllObjects];
        
    } else {
        
        self.arrayButton = [NSMutableArray new];
    }
    
    for (NSUInteger index = 0; index < itemCount; index ++) {
        
        UITabBarItem *tabItem = self.items[index];
        UIImage *image = [tabItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        NDDTabbarItem *button = [[NDDTabbarItem alloc] initWithText:tabItem.title icon:image];
        [button setLineViewColor:self.lineItemColor];
        button.delegate = self;
        button.tag = index;
        [self.arrayButton addObject:button];
        [self insertSubview:button atIndex:0];
    }
}

-(void) didTouchTabbarItem:(NDDTabbarItem *)sender {
    
    NSInteger index = [self.arrayButton indexOfObject:sender];
    UITabBarItem *item = self.items[index];
    [self setSelectedItem:item];
    
    if (self.delegate) {
        
        [self.delegate tabBar:self didSelectItem:item];
    }
}

- (void) updateLayout {
    
    NSUInteger itemCount = self.items.count;
    float width = floorf(self.frame.size.width/(float)itemCount);
    float height = self.frame.size.height;
    
    for (NSUInteger index = 0; index < itemCount;  index++) {
        
        CGRect rect = CGRectMake(index*width, 0, width, height);
        rect.size.width = width + 1;
        
        if (index == itemCount - 1) {
            
            rect.size.width = width + 4;
        }
        
        UIView *view = self.arrayButton[index];
        view.frame = rect;
    }
}

#pragma mark - property

- (void) setItems:(NSArray *)items {
    
    _items = items;
    
    if (self.window) {
        
        [self redraw];
    }
    
    if (!self.selectedItem) {
        
        [self setSelectedItem:[self.items firstObject]];
        
    } else {
        
        [self setSelectedItem:self.selectedItem];
    }
}

- (void) setSelectedItem:(UITabBarItem *)selectedItem {
    
    _selectedItem = selectedItem;
    NSUInteger index = [self.items indexOfObject:selectedItem];
    NSUInteger itemCount = self.items.count;
    
    for (NSUInteger i = 0; i < itemCount; i++) {
        
        UIView *viewItem = self.arrayButton[i];
        if (i == index) {
            
            viewItem.tintColor = self.tinSelectedColor;
            [viewItem setBackgroundColor:self.backgroungSelectedColor];
            
        } else {
            
            viewItem.tintColor = self.tintColor;
            [viewItem setBackgroundColor:[UIColor clearColor]];
        }
    }
}

#pragma mark - action

- (void) didSelectedTab:(UIButton *)sender {
    
    NSUInteger index = [sender tag];
    UITabBarItem *item = self.items[index];
    [self setSelectedItem:item];
    
    if (self.delegate) {
        
        [self.delegate tabBar:self didSelectItem:item];
    }
}

@end

/**
 *  **************************************************************
 */

#pragma mark - Tabbar Controller

@interface NDDTabBarController ()<UITabBarControllerDelegate, NDDTabBarDelegate, UITabBarDelegate>

@property (nonatomic) BOOL isProVersion;

@property (nonatomic, weak) UIViewController *selectedViewController;
@property (weak, nonatomic) IBOutlet UIView *adsBanner;
@property (nonatomic) BOOL hideTabBar;

@end

@implementation NDDTabBarController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.hideTabBar = NO;
    [self setUpColorForTabBar];
    [self setViewControllers:self.viewControllers];
    
    if (!_isProVersion) {
        
        UIView *bannerAds = [[FMGoogleAds shareInstance] loadBannerAds];
        CGRect f = self.adsBanner.frame;
        f.size.height = bannerAds.frame.size.height;
        self.adsBanner.frame = f;
        [self.adsBanner addSubview:bannerAds];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    if (self.isViewLoaded && !self.view.window) {
        
        [self freeAllThingsCanReInit];
    }
}

- (void) viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self updateLayout];
}

#pragma mark - setup method

- (void) setUpColorForTabBar {
    
    [self.tabbar setDelegate:self];
    [self.tabbar setTintColor:[UIColor whiteColor]];
    [self.tabbar setTinSelectedColor:[UIColor redColor]];
    [self.tabbar.topLineView setBackgroundColor:[UIColor clearColor]];
    [self.tabbar setBackgroundColor:[UIColor lightGrayColor]];
    [self.tabbar setBackgroungSelectedColor:[UIColor blueColor]];
}

- (void) setViewControllers:(NSArray *)viewControllers {
    
    _viewControllers = viewControllers;
    if (self.isViewLoaded) {
        
        [self selectViewController:[viewControllers firstObject]];
    }
}

- (void) selectViewController:(UIViewController *)selectViewController {
    
    UITabBarItem *tabItem = selectViewController.tabBarItem;
    [_selectedViewController.view removeFromSuperview];
    [_selectedViewController willMoveToParentViewController:nil];
    [_selectedViewController removeFromParentViewController];
    _selectedViewController = selectViewController;
    
    CGRect mainF = self.contentView.bounds;
    [self addChildViewController:selectViewController];
    [selectViewController didMoveToParentViewController:self];
    
    _selectedViewController.view.frame = mainF;
    _selectedViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.contentView addSubview:_selectedViewController.view];
    
    NSMutableArray *tabbarItems = [NSMutableArray new];
    for (UIViewController *controller in self.viewControllers) {
        [tabbarItems addObject:controller.tabBarItem];
    }
    [self.tabbar setItems:tabbarItems];
    [self.tabbar setSelectedItem:tabItem];
}

#pragma mark - private method

- (void) updateLayout {
    
    if (!self.isViewLoaded || !self.view.window) {
        
        return;
    }
    
    
    if (self.hideTabBar) {
        
        self.contentView.frame = self.view.frame;
        return;
    }
    
    CGFloat viewWidth = self.view.bounds.size.width;
    CGFloat viewHeight = self.view.bounds.size.height;
    CGFloat tabbarHeight = self.tabbar.bounds.size.height;
    CGFloat bannerHeight = 0.0;
    
    if (self.adsBanner && !self.isProVersion) {
        
        bannerHeight = self.tabbar.bounds.size.height;
    }
    
    CGRect contentView = CGRectMake(0, 0, viewWidth, viewHeight - tabbarHeight - bannerHeight);
    self.contentView.frame = contentView;
    
    if (!self.adsBanner) {
        
        return;
    }
    
    if (self.isProVersion) {
        
        [self.adsBanner removeFromSuperview];
        self.adsBanner = nil;
        
    } else {
        
        CGRect bannerFrame = CGRectMake(0, viewHeight - tabbarHeight - bannerHeight, viewWidth, bannerHeight);
        self.adsBanner.frame = bannerFrame;
    }
}

- (void) freeAllThingsCanReInit {
    
    self.contentView = nil;
    self.adsBanner = nil;
    self.tabbar = nil;
    self.view = nil;
    
}

#pragma mark - TabBarDelegate

- (void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger index = [self.tabbar.items indexOfObject:item];
    if (index != NSNotFound) {
        
        UINavigationController *selectedViewController = [self.viewControllers objectAtIndex:index];
        
        if (selectedViewController == self.selectedViewController && [selectedViewController isKindOfClass:[UINavigationController class]]) {
            [selectedViewController popToRootViewControllerAnimated:YES];
            
        } else {
            
            [self selectViewController:selectedViewController];
        }
        
    } else {
        
        [tabBar setSelectedItem:nil];
    }
}

#pragma mark - public method

- (void)setSelectedViewControllerIndex:(NSInteger)index {
    
    [self tabBar:self.tabbar didSelectItem:[self.viewControllers[index] tabBarItem]];
}

- (void) hideTabbar:(BOOL)hidden withAnamiation:(BOOL)animation {
    
    self.hideTabBar = hidden;
    if (hidden) {
        
        CGRect bounds = self.view.bounds;
        CGFloat bannerHeight = 0.0;
        
        if (self.adsBanner && !self.isProVersion) {
            
            bannerHeight = self.adsBanner.bounds.size.height;
        }
        
        if (!animation) {
            
            self.contentView.frame = self.view.frame;
            CGRect tabbarFrame = self.tabbar.frame;
            tabbarFrame.origin.y = bounds.size.height + bannerHeight;
            self.tabbar.frame = tabbarFrame;
            
            if (self.adsBanner && !self.isProVersion) {
                
                CGRect bannerFrame = self.adsBanner.frame;
                bannerFrame.origin.y = bounds.size.height;
                self.adsBanner.frame = bannerFrame;
            }
            
        } else {
            
            [UIView animateWithDuration:0.25 animations:^{
                
                self.contentView.frame = self.view.frame;
                CGRect tabbarFrame = self.tabbar.frame;
                tabbarFrame.origin.y = bounds.size.height + bannerHeight;
                self.tabbar.frame = tabbarFrame;
                
                if (self.adsBanner && !self.isProVersion) {
                    
                    CGRect bannerFrame = self.adsBanner.frame;
                    bannerFrame.origin.y = bounds.size.height;
                    self.adsBanner.frame = bannerFrame;
                }
            }];
        }
        
    } else {
        
        if (!animation) {
            
            [self updateLayout];
            CGRect tabbarFrame = self.tabbar.frame;
            tabbarFrame.origin.y = self.view.bounds.size.height - tabbarFrame.size.height;
            self.tabbar.frame = tabbarFrame;

        } else {
            
            [UIView animateWithDuration:0.25 animations:^{
                
                [self updateLayout];
                CGRect tabbarFrame = self.tabbar.frame;
                tabbarFrame.origin.y = self.view.bounds.size.height - tabbarFrame.size.height;
                self.tabbar.frame = tabbarFrame;
            }];
        }
    }  
}

@end

