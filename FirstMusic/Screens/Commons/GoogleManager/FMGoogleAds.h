//
//  FMGoogleAds.h
//  FirstMusic
//
//  Created by Long on 7/24/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@import GoogleMobileAds;

@interface FMGoogleAds : NSObject
+ (instancetype) shareInstance;
-(UIView *) loadBannerAds;

@end
