//
//  ViewController.h
//  Sqlite Test
//
//  Created by Wiser on 2015/6/8.
//  Copyright (c) 2015年 Wiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"

@interface ViewController : UIViewController  {
    BOOL createDB;
}

@property (readonly, nonatomic) NSString *mainDBName;

- (NSString *)appMainDatabaseFilePath;
@end

