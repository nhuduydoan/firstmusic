//
//  FMPlayerViewController.h
//  FirstMusic
//
//  Created by Long on 7/24/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define fmPlayer [FMPlayerViewController shareInstance]

@interface FMPlayerViewController : UIViewController

@property (strong, nonatomic) FMTrackModel *currentTrack;

+ (instancetype) shareInstance;
- (void) show;
- (void) playWithTrack:(FMTrackModel *)track;
 
@end
