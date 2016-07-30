//
//  FMSearchViewController.m
//  FirstMusic
//
//  Created by Long on 7/24/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMSearchViewController.h"
#import "FMTracksTableVC.h"

@interface FMSearchViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchView;
@property (strong, nonatomic) FMTracksTableVC *trackTableView;
@property (strong, nonatomic) NSMutableArray<FMTrackModel *> *dataSearch;

@end

@implementation FMSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup view method

- (void) setupData {
    
    self.dataSearch = [NSMutableArray new];
    
    for (int i = 0; i < 20; i ++) {
        
        FMTrackModel *track = [FMTrackModel new];
        track.trackId = i + 1;
        track.displayName = [NSString stringWithFormat:@"Track Play %d", i];
        [self.dataSearch addObject:track];
    }
    
    self.trackTableView = [[FMTracksTableVC alloc] initWithListDatas:self.dataSearch];
    [self displayViewController:self.trackTableView];
}

#pragma mark - private method

- (void) displayViewController:(UIViewController *)childVC {
    
    [self addChildViewController:childVC];
    [childVC didMoveToParentViewController:self];
    [childVC.view setFrame:self.view.frame];
    childVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:childVC.view];
}

@end
