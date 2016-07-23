//
//  NDDTabBarItem.h
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/23/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NDDTabbarItem;

@protocol NDDTabbarItemDelegate <NSObject>

- (void)didTouchTabbarItem:(NDDTabbarItem *)sender;

@end

@interface NDDTabbarItem : UIView

- (instancetype)initWithText:(NSString *)text icon:(UIImage *)image;
@property (weak, nonatomic) id<NDDTabbarItemDelegate> delegate;

@end
