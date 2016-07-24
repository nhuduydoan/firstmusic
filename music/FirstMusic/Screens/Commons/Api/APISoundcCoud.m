//
//  APISoundcCoud.m
//  Music
//
//  Created by Long on 7/23/16.
//  Copyright © 2016 Long. All rights reserved.
//

#import "APISoundcCoud.h"

@implementation APISoundcCoud

-(void)getAIP:(void (^)(NSData *data, NSError *error))completionHandler{
//    NSString * sURL = @"https://api-v2.soundcloud.com/charts?kind=top&genre=soundcloud%3Agenres%3Aall-music&limit=20&offset=0&linked_partitioning=1&client_id=Fiy8xlRI0xJNNGDLbPmGUjTpPRESPx8C";
    NSString * sturls = @"https://api.soundcloud.com/explore/sounds/category?limit=10&offset=0&linked_partitioning=1";
    NSString * strUrl = @"https://api.soundcloud.com/tracks.json?client_id=Fiy8xlRI0xJNNGDLbPmGUjTpPRESPx8C&filter=all&order=hotness&offset=0&q=h&limit=50";
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *dataTask =[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completionHandler(nil,error);
        } else {
            completionHandler(data,nil);
        }
    }];
    [dataTask resume];
 }


@end
