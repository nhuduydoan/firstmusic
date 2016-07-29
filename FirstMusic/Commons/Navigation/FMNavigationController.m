//
//  FMNavigationController.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/18/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMNavigationController.h"
@interface FMNavigationController () <UINavigationControllerDelegate>

@property (strong, nonatomic) UIBarButtonItem *showPlayer;
@property (strong, nonatomic) UINavigationController *playerVC;

@end

@implementation FMNavigationController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    self.showPlayer = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrowdown"] style:UIBarButtonItemStylePlain target:self action:@selector(showPlayerViewController)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidePlayerViewController) name:@"HidePlayerController" object:nil];
    [self.navigationBar setTintColor:navigationbarTintColor];
    [self.navigationBar setBackgroundColor:navigationbarBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    viewController.navigationItem.rightBarButtonItem = self.showPlayer;
}

- (void) showPlayerViewController {
    
    self.playerVC = [[UINavigationController alloc] initWithRootViewController:fmPlayer];
    [self displayViewController:self.playerVC];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.playerVC.view setFrame:self.view.frame];
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HideTabBar" object:nil];
}

- (void) hidePlayerViewController {
    
    CGRect frame = self.view.bounds;
    frame.origin.y = -frame.size.height;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.playerVC.view setFrame:frame];
        
    } completion:^(BOOL finished) {
        
        [self.playerVC willMoveToParentViewController:nil];
        [self.playerVC.view removeFromSuperview];
        [self.playerVC removeFromParentViewController];
        self.playerVC = nil;
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ShowTabBar" object:nil];
}

- (void) displayViewController:(UIViewController *)childVC {
    
    [self addChildViewController:childVC];
    [childVC didMoveToParentViewController:self];
    CGRect frame = self.view.bounds;
    frame.origin.y = - frame.size.height;
    [childVC.view setFrame:frame];
    childVC.view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:childVC.view];
}

@end