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
    FMDatabaseQueue *queue = [[FMDatabaseQueue alloc ]initWithPath:[self appMainDatabaseFilePath]];
    //Drop Table
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"DROP TABLE SuperStarStats"];
    }];
    //Create Table SuperStarStats
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"CREATE TABLE IF NOT EXISTS SuperStarStats(id INTEGER PRIMARY KEY, Date TEXT , Name TEXT , Points TEXT, Rebounds TEXT , Assists TEXT , Blocks TEXT , Steals TEXT)"];
    }];
    
    //Insert records
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"INSERT INTO SuperStarStats (id ,Date , Name, Points, Rebounds , Assists , Blocks , Steals) VALUES (1,'2015-06-07','Lebron James', '39' , '16' , '11' ,'1' , '1')"];
        [db executeUpdate:@"INSERT INTO SuperStarStats (id,Date , Name, Points, Rebounds , Assists , Blocks , Steals) VALUES (2,'2015-06-07','Stephen Curry', '0' , '0' , '0' ,'0' , '0')"];
    }];
    
    //Read/Query records
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT Date, Name, Points FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"%@ %@ %@\n",[message stringForColumn:@"Date"],[message stringForColumn:@"Name"],[message stringForColumn:@"Points"]);
            
        }
        [message close];
    }];
    
    //Update a record
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"REPLACE INTO SuperStarStats(id, Date, Name, Points, Rebounds , Assists , Blocks , Steals) VALUES(2,'2015-06-07','Stephen Curry','19','6','5','0','0')"];
     }];
    //Read/Query records
    [queue inDatabase:^(FMDatabase *db){
        FMResultSet *message = [db executeQuery:@"SELECT Date, Name, Points FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"%@ %@ %@\n",[message stringForColumn:@"Date"],[message stringForColumn:@"Name"],[message stringForColumn:@"Points"]);
            
        }
        [message close];
    }];
    
    //Delete record
    [ queue  inDatabase:^(FMDatabase *db){
        [db executeUpdate:@"DELETE FROM SuperStarStats WHERE id = ?",@"2"];
    }];
    //Read/Query records
    [queue inDatabase:^(FMDatabase *db){
        FMResultSet *message = [db executeQuery:@"SELECT Date, Name, Points FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"%@ %@ %@\n",[message stringForColumn:@"Date"],[message stringForColumn:@"Name"],[message stringForColumn:@"Points"]);
            
        }
        [message close];
    }];

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
