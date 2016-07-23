//
//  FMNavigationController.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/18/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMNavigationController.h"
@interface FMNavigationController () <UINavigationControllerDelegate>

@property (strong, nonatomic)  UIBarButtonItem *hideTabBarItem;
@property (nonatomic) BOOL isHideTabBar;

@end

@implementation FMNavigationController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    self.hideTabBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Hide" style:UIBarButtonItemStylePlain target:self action:@selector(touchOnHideTabBarItem)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    viewController.navigationItem.rightBarButtonItem = self.hideTabBarItem;
}

- (void) touchOnHideTabBarItem {
    
    self.isHideTabBar = !self.isHideTabBar;
    if (self.isHideTabBar) {
        
        CGRect frame = self.view.frame;
        frame.origin.y = - frame.size.height;
        UIViewController *view = [[UIViewController alloc] init];
        [self addChildViewController:view];
        view.view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
        [view.view setBackgroundColor:[UIColor redColor]];
        [view didMoveToParentViewController:self];
        [view.view setFrame:frame];
        [self.view addSubview:view.view];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"HideTabBar" object:nil];
        [UIView animateWithDuration:0.25 animations:^{
            
            [view.view setFrame:self.view.frame];
        }];
        
    } else {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ShowTabBar" object:nil];
    }
}

@end
