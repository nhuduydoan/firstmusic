//
//  FMPlayerViewController.m
//  FirstMusic
//
//  Created by Long on 7/24/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMPlayerViewController.h"

@interface FMPlayerViewController ()

@property (strong, nonatomic) UIBarButtonItem *hideItem;
@property (strong, nonatomic) UIBarButtonItem *songsItem;

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
    
    self.hideItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"exit"] style:UIBarButtonItemStylePlain target:self action:@selector(touchOnHideItem)];
    self.songsItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_more_option"] style:UIBarButtonItemStylePlain target:self action:@selector(touchOnSongsItem)];
    self.navigationItem.leftBarButtonItem = self.hideItem;
    self.navigationItem.rightBarButtonItem = self.songsItem;
    
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Player";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchOnHideItem {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidePlayerController" object:nil];
}

- (void) touchOnSongsItem {
    
}

- (void) playWithTrack:(FMTrackModel *)track {
    
    if (track.trackId == self.currentTrack.trackId) {
        
        return;
    }
    
    self.currentTrack = track;
    // play with track
}

@end
