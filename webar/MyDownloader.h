//
//  MyDownloader.h
//  webar
//
//  Created by 贾玉斌 on 16/2/20.
//  Copyright © 2016年 贾玉斌. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id representData);
typedef void(^FailureBlock)(NSString *error);




@interface MyDownloader : NSObject

+(void)getNsurl:(NSString *)year whenSuccess:(SuccessBlock)success andFailure:(FailureBlock)failure;

+(void)starRequestWithUrlString:(NSString *)urlStr whenSuccess:(SuccessBlock)success andFailure:(FailureBlock)failure;
//首页数据
//+(void) getMainMenuDataWithPage:(NSInteger)page whenSuccess:(SuccessBlock)success andFailure:(FailureBlock)failure;





@end
