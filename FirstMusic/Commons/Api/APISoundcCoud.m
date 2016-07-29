//
//  APISoundcCoud.m
//  Music
//
//  Created by Long on 7/23/16.
//  Copyright © 2016 Long. All rights reserved.
//

#import "APISoundcCoud.h"


@implementation APISoundcCoud

- (void) allCategoriesSoundcloudWithCompleteBlock:(void (^)(NSArray *, NSError *))completeBlock {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Categories" ofType:@"plist"];
    NSDictionary *datas = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *categories = [datas valueForKey:@"Others"];
    
    if (categories.count) {
        
        for (NSDictionary *dict in categories) {
            NSLog(@"%@", dict);
        }
    }
    
    NSDictionary *ituneTop100 = [datas valueForKey:@"iTunesTop100"];
    NSLog(@"\n === Itune Top 100 === \n %@", ituneTop100);
    
    if (completeBlock) {
        completeBlock(categories, nil);
    }
}

-(void)getAIP:(void (^)(NSData *data, NSError *error))completionHandler {
    
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
