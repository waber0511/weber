//
//  MyDownloader.m
//  webar
//
//  Created by 贾玉斌 on 16/2/20.
//  Copyright © 2016年 贾玉斌. All rights reserved.
//

#import "MyDownloader.h"
#import "AFHTTPRequestOperationManager.h"




@implementation MyDownloader

+(void)getNsurl:(NSString *)str whenSuccess:(SuccessBlock)success andFailure:(FailureBlock)failure
{
    NSString *urlString=str;
    [MyDownloader starRequestWithUrlString:urlString whenSuccess:success andFailure:failure];
    
}

+(void)starRequestWithUrlString:(NSString *)urlStr whenSuccess:(SuccessBlock)success andFailure:(FailureBlock)failure
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error.localizedDescription);
    }];
    
}


@end
