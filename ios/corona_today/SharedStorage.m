//
//  SharedStorage.m
//  corona_today
//
//  Created by 신동현 on 2020. 12. 24..
//

#import "SharedStorage.h"
#import "React/RCTLog.h"

@implementation SharedStorage
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(set:(NSString*)data resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
  @try {
    NSUserDefaults *shared = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.highmaru.corona_today"];
    [shared setObject:data forKey:@"data"];
    [shared synchronize];
    resolve(@"true");
  }@catch(NSException *e) {
    reject(@"err",e.reason, nil)
  }
}
@end
