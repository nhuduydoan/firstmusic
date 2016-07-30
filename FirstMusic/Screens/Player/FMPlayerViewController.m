//
//  FMPlayerViewController.m
//  FirstMusic
//
//  Created by Long on 7/24/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMPlayerViewController.h"
#import "NDDTabBarController.h"

@interface FMPlayerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation FMPlayerViewController


+ (instancetype) shareInstance {
    
    static FMPlayerViewController *shareInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (shareInstance == nil) {
            
            shareInstance = [[FMPlayerViewController alloc] init];
        }
    });
    
    return shareInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.leftButton setImage:[UIImage imageNamed:@"exit"] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:@"icon_more_option"] forState:UIControlStateNormal];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Player";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - set up view

#pragma mark - private method

- (IBAction)touchOnleftButton:(id)sender {
    
    [self hide];
}

- (IBAction)touchOnRightButton:(id)sender {
    
}

- (void) hideTabbar:(BOOL)hide withAnimation:(BOOL)animated {
    
    UIViewController *tabbarVC = self.parentViewController;
    while (tabbarVC.parentViewController && tabbarVC.class != [NDDTabBarController class]) {
        
        tabbarVC = tabbarVC.parentViewController;
    }
    
    if (tabbarVC.class == [NDDTabBarController class]) {
        
        [((NDDTabBarController *)tabbarVC) hideTabbar:hide withAnamiation:animated];
    }
}

#pragma mark - public method

- (void) show {
    
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    while (rootVC.parentViewController && rootVC.parentViewController.class != self.class) {
        
        rootVC = rootVC.parentViewController;
    }
    
    [self displayInViewController:rootVC];
    
    CGRect frame = rootVC.view.bounds;
    [UIView animateWithDuration:0.25 animations:^{
        
        [fmPlayer.view setFrame:frame];
    }];
    
    [self hideTabbar:YES withAnimation:YES];
}

- (void) hide {
    
    CGRect frame = self.view.bounds;
    frame.origin.y = -frame.size.height;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [fmPlayer.view setFrame:frame];
        
    } completion:^(BOOL finished) {
        
        [fmPlayer willMoveToParentViewController:nil];
        [fmPlayer.view removeFromSuperview];
        [fmPlayer removeFromParentViewController];
    }];
    
    [self hideTabbar:NO withAnimation:YES];
}

- (void) displayInViewController:(UIViewController *)vc {
    
    [vc addChildViewController:self];
    [self didMoveToParentViewController:self];
    CGRect frame = vc.view.bounds;
    frame.origin.y = - frame.size.height;
    [self.view setFrame:frame];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [vc.view addSubview:self.view];
}

- (void) playWithTrack:(FMTrackModel *)track {
    
    if (track.trackId == self.currentTrack.trackId) {
        
        return;
    }
    
    self.currentTrack = track;
    // play with track
}

@end
