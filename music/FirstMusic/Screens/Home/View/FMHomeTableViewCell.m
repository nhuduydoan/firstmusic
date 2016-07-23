//
//  HomeTableViewCell.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/18/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMHomeTableViewCell.h"

@interface FMHomeTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation FMHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype) cellWithIdentifier:(NSString *)identifier {
    
    FMHomeTableViewCell *cell = [[self alloc] init];
    
    if (cell) {
        
        [cell setValue:identifier forKey:@"Identifier"];
    }
    
    return cell;
}

- (void) displayModel:(NSString *) string {

    self.titleLabel.text = string;
}

@end
