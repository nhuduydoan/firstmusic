//
//  FMTrackTableViewCell.h
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/25/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMTrackTableViewCell : UITableViewCell

+ (instancetype) cellWithIndentifier:(NSString *)identifier;
- (void) displayWithTrack:(FMTrackModel *)track;

@end
