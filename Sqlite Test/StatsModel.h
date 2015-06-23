//
//  StatsModel.h
//  Sqlite Test
//
//  Created by Wiser on 2015/6/12.
//  Copyright (c) 2015年 Wiser. All rights reserved.
//

@interface StatsModel : NSThread  

+ (id)sharedInstance;
@property (nonatomic) BOOL a;
-(void)addAssist:(NSNumber *)id ;
@end