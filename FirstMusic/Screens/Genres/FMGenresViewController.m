//
//  FMGenresViewController.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/29/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMGenresViewController.h"

@interface FMGenresViewController ()

@end

@implementation FMGenresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self getAllCategories];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init view method

-(void) getDataBaseAPI {
    
    APISoundcCoud * api = [[APISoundcCoud alloc] init];
    [api getAIP:^(NSData *data, NSError *error) {
        if (!error) {
        }
    }];
}

- (void) getAllCategories {
    
    APISoundcCoud * api = [[APISoundcCoud alloc] init];
    
    [api allCategoriesSoundcloudWithCompleteBlock:^(NSArray *datas, NSError *error) {
       
        if (datas.count) {
            NSLog(@" == Exist data ==");
        }
    }];
}

@end
