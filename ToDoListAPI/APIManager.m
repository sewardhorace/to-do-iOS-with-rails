//
//  APIManager.m
//  networking2
//
//  Created by Max White on 9/20/15.
//  Copyright (c) 2015 Max White. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

+ (void)GETRequestWithURL:(NSURL *)URL completionHandler:(void(^)(NSData *, NSURLResponse *, NSError *)) completionHandler {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(data, response, error);
        });
    }];
    
    [task resume];
}

+ (void)POSTRequestWithURL:(NSURL *)URL Data: (NSData *)data{
    
    NSLog(@"POST request started");
    
    NSMutableURLRequest *buildRequest = [[NSMutableURLRequest alloc] init];
    
    [buildRequest setURL:URL];
    [buildRequest setHTTPMethod:@"POST"];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu",[data length]];
    [buildRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [buildRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [buildRequest setHTTPBody:data];
    NSLog(@"data: %@", data);
    
    
    NSURLRequest *request = buildRequest;
    
    NSDictionary *requestData = [NSJSONSerialization JSONObjectWithData:[request HTTPBody] options:0 error:nil];
    
    NSLog(@"request: %@", requestData);
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
    
    [task resume];
    
    NSLog(@"POST request finished");
    
//    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//    if(connection) {
//        NSLog(@"Connection Successful");
//    } else {
//        NSLog(@"Connection could not be made");
//    }
}

//#pragma mark - NSURLConnectionDelegate methods
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data{
//    NSLog(@"%@", data);
//}
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
//    NSLog(@"%@", error);
//}
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
//    NSLog(@"connection did finish loading");
//}

@end
