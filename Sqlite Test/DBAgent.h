//
//  DBAgent.h
//  Sqlite Test
//
//  Created by Wiser on 2015/6/12.
//  Copyright (c) 2015年 Wiser. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface DBAgent : FMDatabaseQueue{
   BOOL createDB;
}
@property (readonly, nonatomic) NSString *mainDBName;
@end
