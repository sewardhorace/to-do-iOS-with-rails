//
//  APIManager.h
//  networking2
//
//  Created by Max White on 9/20/15.
//  Copyright (c) 2015 Max White. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject <NSURLConnectionDelegate>


+ (void)GETRequestWithURL:(NSURL *)URL completionHandler:(void(^)(NSData *, NSURLResponse *, NSError *)) completionHandler;

+ (void)POSTRequestWithURL:(NSURL *)URL Data: (NSData *)data;

@end
