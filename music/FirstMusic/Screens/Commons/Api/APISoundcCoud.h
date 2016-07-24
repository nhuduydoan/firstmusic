//
//  APISoundcCoud.h
//  Music
//
//  Created by Long on 7/23/16.
//  Copyright © 2016 Long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APISoundcCoud : NSObject
-(void)getAIP:(void (^)(NSData *data, NSError *error))completionHandler;
@end
