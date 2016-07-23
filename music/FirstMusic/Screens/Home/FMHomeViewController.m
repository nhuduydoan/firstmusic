//
//  HomeViewController.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/18/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMHomeViewController.h"
#import "FMHomeTableViewCell.h"

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
        [self setupData];
    }
    
    return self;
}

- (void) setupData {
    
    for (int i = 0; i < 10; i ++) {
        
        NSString *testString = [NSString stringWithFormat:@"Music %d", i];
        [self.listDatas addObject:testString];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FMHomeTableViewCell class]) bundle:nil] forCellReuseIdentifier:HomeCell];
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

    [cell displayModel:[self.listDatas objectAtIndex:indexPath.row]];
    return cell;
}

@end
