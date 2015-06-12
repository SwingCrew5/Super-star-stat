//
//  StatsModel.m
//  Sqlite Test
//
//  Created by Wiser on 2015/6/12.
//  Copyright (c) 2015年 Wiser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatsModel.h"
@interface StatsModel() {
}

@end
@implementation StatsModel
static StatsModel *sharedInstance = nil;
+ (id)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[StatsModel alloc] init];
    });
    return sharedInstance;
}
- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}
- (void)dealloc {
    // 永遠不被執行
}
- (void)main {
    
}
@end