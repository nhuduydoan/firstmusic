//
//  HomeViewController.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/18/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMHomeViewController.h"
#import "FMHomeTableViewCell.h"
#import "APISoundcCoud.h"
#import "FMPlayerViewController.h"

#define HomeCell @"HomeTableViewCell"

@interface FMHomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *listDatas;

@end

@implementation FMHomeViewController

- (instancetype) init {
    self = [super init];
    
    if (self) {
        
        _listDatas = [NSMutableArray new];
        [self getDataBaseAPI];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FMHomeTableViewCell class]) bundle:nil] forCellReuseIdentifier:HomeCell];
}
-(void) getDataBaseAPI{
    APISoundcCoud * api = [[APISoundcCoud alloc] init];
    __weak typeof(self) weakSelf = self;
    [api getAIP:^(NSData *data, NSError *error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.listDatas = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                [_tableView reloadData];
                NSLog(@"%@", weakSelf.listDatas);
            });
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listDatas.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FMHomeTableViewCell *cell = (FMHomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:HomeCell];
    
    if (!cell) {
        
        cell = [FMHomeTableViewCell cellWithIdentifier:HomeCell];
    }

    [cell displayModel:[[self.listDatas objectAtIndex:indexPath.row] valueForKey:@"title"]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.isHideTabBar) {
//        
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
        
//    } else {
//        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"ShowTabBar" object:nil];
//    }

}

@end
