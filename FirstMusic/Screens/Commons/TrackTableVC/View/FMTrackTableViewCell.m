//
//  FMTrackTableViewCell.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/25/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMTrackTableViewCell.h"

@interface FMTrackTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;

@end

@implementation FMTrackTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype) cellWithIndentifier:(NSString *)identifier {
    
    FMTrackTableViewCell *cell = [[self alloc] init];
    [cell setValue:identifier forKey:@"Identifier"];
    return cell;
}

- (void) displayWithTrack:(FMTrackModel *)track {
    
    self.titleLabel.text = track.displayName;
    self.noteLabel.text = [NSString stringWithFormat:@"id: %ld", track.trackId];
}

@end
