//
//  FMTracksTableVC.h
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/25/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMTracksTableVC : UIViewController

- (instancetype) initWithListDatas:(NSArray<FMTrackModel *> *)listDatas;
- (void) reloadData;
- (void) reloadData:(NSArray<FMTrackModel *> *)listDatas;

@end
