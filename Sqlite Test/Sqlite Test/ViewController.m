//
//  ViewController.m
//  Sqlite Test
//
//  Created by Wiser on 2015/6/8.
//  Copyright (c) 2015年 Wiser. All rights reserved.
//

#import "ViewController.h"
#import "DBAgent.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    DBAgent *dbAgent = [[DBAgent alloc ]initWithPath:@""];
    //FMDatabaseQueue *queue = [[FMDatabaseQueue alloc ]initWithPath:[self appMainDatabaseFilePath]];
    //Drop Table
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"DROP TABLE SuperStarStats"];
    }];
    //Create Table SuperStarStats
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"CREATE TABLE IF NOT EXISTS SuperStarStats(id INTEGER PRIMARY KEY, Date TEXT , Name TEXT, Points INTEGER, Rebounds INTEGER , Assists INTEGER , Blocks INTEGER , Steals INTEGER ,Two_attempts INTEGER , Two_goals INTEGER , Three_attempts INTEGER , Three_goals INTEGER , FT_attempts INTEGER, FT_goals INTEGER)"];
    }];
    
    //Insert records
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"INSERT INTO SuperStarStats (id ,Date , Name, Points, Rebounds , Assists , Blocks , Steals,Two_attempts  , Two_goals  , Three_attempts  , Three_goals  , FT_attempts , FT_goals ) VALUES (1,'2015-06-07','Lebron James', '39' , '16' , '11' ,'1' , '1' , '0', '0', '0', '0', '0', '0')"];
        [db executeUpdate:@"INSERT INTO SuperStarStats (id,Date , Name, Points, Rebounds , Assists , Blocks , Steals,Two_attempts  , Two_goals  , Three_attempts  , Three_goals  , FT_attempts , FT_goals ) VALUES (2,'2015-06-07','Stephen Curry', '0' , '0' , '0' ,'0' , '0', '0', '0', '0', '0', '0', '0')"];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT Date, Name, Points FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"%@ %@ %@\n",[message stringForColumn:@"Date"],[message stringForColumn:@"Name"],[message stringForColumn:@"Points"]);
            
        }
        [message close];
    }];
    
    //Update a record
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"REPLACE INTO SuperStarStats(id, Date, Name, Points, Rebounds , Assists , Blocks , Steals) VALUES(2,'2015-06-07','Stephen Curry','19','6','5','0','0')"];
     }];
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db){
        FMResultSet *message = [db executeQuery:@"SELECT Date, Name, Points FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"%@ %@ %@\n",[message stringForColumn:@"Date"],[message stringForColumn:@"Name"],[message stringForColumn:@"Points"]);
            
        }
        [message close];
    }];
    
    //Delete record
    [ dbAgent  inDatabase:^(FMDatabase *db){
        [db executeUpdate:@"DELETE FROM SuperStarStats WHERE id = ?",@"2"];
    }];
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db){
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
@end
