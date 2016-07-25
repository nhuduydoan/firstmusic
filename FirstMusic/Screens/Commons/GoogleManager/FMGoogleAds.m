//
//  FMGoogleAds.m
//  FirstMusic
//
//  Created by Long on 7/24/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "FMGoogleAds.h"
@import GoogleMobileAds;

@interface FMGoogleAds ()<GADBannerViewDelegate>

@property (strong, nonatomic) GADBannerView *bannerAds;

@end

@implementation FMGoogleAds

+ (instancetype) shareInstance {
    
    static FMGoogleAds *shareInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (shareInstance == nil) {
            
            shareInstance = [[FMGoogleAds alloc] init];
        }
    });
    
    return shareInstance;
}

-(UIView *) loadBannerAds {
        
        NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
        
        UIViewController *rootVC = [[[UIApplication sharedApplication] delegate] window].rootViewController;
        
        while (rootVC.parentViewController) {
            rootVC = rootVC.parentViewController;
        }
        
        self.bannerAds = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
        self.bannerAds.rootViewController = rootVC;
        self.bannerAds.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
        [self.bannerAds loadRequest:[GADRequest request]];
        
        return _bannerAds;
}
@end

