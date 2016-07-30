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

@end

@implementation FMNavigationController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    self.navigationBar.translucent = NO;
    [self.navigationBar setTintColor:navigationbarTintColor];
    [self.navigationBar setBarTintColor:navigationbarDefaultColor];
    
    self.showPlayer = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrowdown"] style:UIBarButtonItemStylePlain target:self action:@selector(showPlayerViewController)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    viewController.navigationItem.rightBarButtonItem = self.showPlayer;
}

- (void) showPlayerViewController {
    
    [fmPlayer show];
}

@end
