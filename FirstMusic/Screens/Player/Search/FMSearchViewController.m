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
@property (strong, nonatomic) NSMutableArray<FMTrackModel *> *searchDatas;

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

- (void) setupSearchBar {
    
    [self.trackTableView reloadData:self.searchDatas];
}

- (void) setupData {
    
    self.searchDatas = [NSMutableArray new];
    
    for (int i = 0; i < 20; i ++) {
        
        FMTrackModel *track = [FMTrackModel new];
        track.trackId = i + 1;
        track.displayName = [NSString stringWithFormat:@"Track Play %d", i];
        [self.searchDatas addObject:track];
    }
    
    self.trackTableView = [[FMTracksTableVC alloc] initWithListDatas:self.searchDatas];
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
