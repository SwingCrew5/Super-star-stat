//
//  ViewController.m
//  Sqlite Test
//
//  Created by Wiser on 2015/6/8.
//  Copyright (c) 2015年 Wiser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mainDBName = @"SqliteDB.sqlite";
    
    if(![self databaseExist]){
        [self copyDatabase];
        createDB = YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)appMainDatabaseFilePath {
    NSString *cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *dbPath = [cachesDirectory stringByAppendingPathComponent:_mainDBName];
    return dbPath;
}
- (NSString *)appMainDatabaseBundleFilePath {
    NSString *dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:_mainDBName];
    return dbPath;
}
- (void)copyDatabase
{
    NSError *error;
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    NSString *dbFilePath = [self appMainDatabaseBundleFilePath];
    
    NSString * dbCachePath = [self appMainDatabaseFilePath];
    
    //Copy the database file to the users document directory.
    if (![fileManager copyItemAtPath:dbFilePath toPath:dbCachePath error:&error])
        NSLog(@"Failed to copy the database. Error: %@.", [error localizedDescription]);
    
}

- (BOOL)databaseExist
{
    NSFileManager *fileManager =  [[NSFileManager alloc] init];
    return [fileManager fileExistsAtPath:[self appMainDatabaseFilePath]];
}
@end
