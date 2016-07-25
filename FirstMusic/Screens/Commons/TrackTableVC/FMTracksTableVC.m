//
//  FMTracksTableVC.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/25/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMTracksTableVC.h"
#import "FMTrackTableViewCell.h"

#define TrackTableViewCell @"TrackTableViewCell"

@interface FMTracksTableVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSMutableArray<FMTrackModel *> *listDatas;

@end

@implementation FMTracksTableVC

- (instancetype) initWithListDatas:(NSMutableArray<FMTrackModel *> *)listDatas {
    self = [super init];
    
    if (self) {
        
        self.listDatas = listDatas;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableview registerNib:[UINib nibWithNibName:NSStringFromClass([UITableViewCell class]) bundle:nil] forCellReuseIdentifier:TrackTableViewCell];
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
    
    FMTrackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TrackTableViewCell];
    
    if (cell == nil) {
        
        cell = [FMTrackTableViewCell cellWithIndentifier:TrackTableViewCell];
    }
    
    FMTrackModel *track = [self.listDatas objectAtIndex:indexPath.row];
    [cell displayWithTrack:track];
    
    return cell;
}

@end
