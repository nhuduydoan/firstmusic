//
//  NDDTabarItem.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/23/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "NDDTabbarItem.h"

@interface NDDTabbarItem()

@property (weak, nonatomic) IBOutlet UIImageView *iconTabbar;
@property (weak, nonatomic) IBOutlet UILabel *tiltTabbar;

@end

@implementation NDDTabbarItem

- (instancetype)initWithText:(NSString *)text icon:(UIImage *)image {
    self = [super init];
    
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"NDDTabbarItem" owner:self options:nil] objectAtIndex:0];
        self.iconTabbar.image = image;
        self.tiltTabbar.text = text;
        
    }
    
    return self;
}

- (IBAction)touchedOnButton:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(didTouchTabbarItem:)]) {
        [self.delegate didTouchTabbarItem:self];
    }
}

- (void) setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    NSLog(@"");
}

@end

