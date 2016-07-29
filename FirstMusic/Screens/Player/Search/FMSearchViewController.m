//
//  FMSearchViewController.m
//  FirstMusic
//
//  Created by Long on 7/24/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMSearchViewController.h"
//#import "FMHomeTableViewCell.h"

#define HomeCell @"HomeTableViewCell"

@interface FMSearchViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchView;
@property (weak, nonatomic) NSArray *dataSearch;

@end

@implementation FMSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.dataSearch = [[NSArray alloc] initWithObjects:@"cell 1", @"cell 2",@"cell 3",@"cell 4",@"cell 5",@"cell 6", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSearch.count;
}
//-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
////    FMHomeTableViewCell * cell = (FMHomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:HomeCell];
////    if(!cell){
////        cell = [FMHomeTableViewCell cellWithIdentifier:HomeCell];
////    }
////    NSLog(@"%ld",self.dataSearch.count);
////    cell.textLabel.text = [self.dataSearch objectAtIndex:indexPath.row];
////    return cell;
//}

@end
