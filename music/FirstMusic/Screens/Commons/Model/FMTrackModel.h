//
//  FMTrackModel.h
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/24/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMTrackModel : NSObject

@property (nonatomic) unsigned long trackId;
@property (strong, nonatomic) NSString *displayName;
@property (strong, nonatomic) NSString *playUrl;
@property (strong, nonatomic) NSString *iconUrl;


- (instancetype) initWithDictinary:(NSDictionary *)dict;

@end
