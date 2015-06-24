//
//  StatsModel.m
//  Sqlite Test
//
//  Created by Wiser on 2015/6/12.
//  Copyright (c) 2015年 Wiser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatsModel.h"
#import "DBAgent.h"
@interface StatsModel() {
}

@end
@implementation StatsModel
static StatsModel *sharedInstance = nil;
int assist;

+ (id)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[StatsModel alloc] init];
    });
    return sharedInstance;
}
- (id)init {
    if (self = [super init]) {
        assist=15;
        [self loadDataFromDB:[NSNumber numberWithInt:2]];
        //Access DB in Data Model , it should refined as functions
        DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
        //Drop Table
        [dbAgent inDatabase:^(FMDatabase *db) {
            [db executeUpdate:@"DROP TABLE SuperStarStats"];
        }];
        //Create Table SuperStarStats
        [dbAgent inDatabase:^(FMDatabase *db) {
            [db executeUpdate:@"CREATE TABLE IF NOT EXISTS SuperStarStats( id INTEGER PRIMARY KEY, date TEXT , name TEXT , offRebound INTEGER,defRebound INTEGER, assist INTEGER , block INTEGER , steal INTEGER ,twoAttempt INTEGER , twoMade INTEGER , threeAttempt INTEGER , threeMade INTEGER , ftAttempt INTEGER, ftMade INTEGER ,turnOver INTEGER,foul INTEGER)"];
        }];

         
         //Insert records
         [dbAgent inDatabase:^(FMDatabase *db) {
             [db executeUpdate:@"INSERT INTO SuperStarStats( id , date , name  , offRebound  , defRebound , assist  , block  , steal  , twoAttempt  , twoMade  , threeAttempt  , threeMade  , ftAttempt  , ftMade  , turnOver , foul ) VALUES(1 , '2015-06-07' , 'Lebron James' , 3 , 7 , 11 , 1 , 1 , 20 , 10 , 10 , 4 , 15 ,  12 , 2 , 3 )"];
             [db executeUpdate:@"INSERT INTO SuperStarStats ( id , date , name  , offRebound  , defRebound , assist  , block  , steal  , twoAttempt  , twoMade  , threeAttempt  , threeMade  , ftAttempt  , ftMade  , turnOver , foul ) VALUES(2 , '2015-06-09' , 'Stephen Curry' , 1 , 4 , ? , 0 , 3 , 15 , 10 , 12 , 5 , 10 ,  9 , 1 , 2 )" , [NSNumber numberWithInt:assist]];
         }];
         
         //Read/Query records
         [dbAgent inDatabase:^(FMDatabase *db) {
         FMResultSet *message = [db executeQuery:@"SELECT date, name , assist FROM SuperStarStats"];
         while ([message next]){
             NSLog(@"\n%@ %@ assist=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"assist"]);
         
         }
         [message close];
         }];
//         //Update record
//         [dbAgent inDatabase:^(FMDatabase *db) {
//         [db executeUpdate:@"UPDATE SuperStarStats SET assist=17  WHERE id=2"];
//         }];
//        
//         //Read/Query records
//         [dbAgent inDatabase:^(FMDatabase *db){
//         FMResultSet *message = [db executeQuery:@"SELECT date, name FROM SuperStarStats"];
//         while ([message next]){
//             NSLog(@"%@ %@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"]);
//         
//         }
//         [message close];
//         }];
        
//         //Delete record
//         [ dbAgent  inDatabase:^(FMDatabase *db){
//         [db executeUpdate:@"DELETE FROM SuperStarStats WHERE id = ?",@"2"];
//         }];
        
         //Read/Query records
//         [dbAgent inDatabase:^(FMDatabase *db){
//         FMResultSet *message = [db executeQuery:@"SELECT date, name FROM SuperStarStats"];
//         while ([message next]){
//             NSLog(@"%@ %@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"]);
//         
//         }
//         [message close];
//         }];
    }
    return self;
}
- (void)dealloc {
    // 永遠不被執行
}
- (void)main {
    
}
-(void)loadDataFromDB:(NSNumber*)id{
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT id , date , name  , offRebound  , defRebound , assist  , block  , steal  , twoAttempt  , twoMade  , threeAttempt  , threeMade  , ftAttempt  , ftMade  , turnOver , foul FROM SuperStarStats WHERE id= ?",id];
        _dataDic = [[NSMutableDictionary alloc]init];
        while ([message next]){
            NSLog(@"\n%@ %@ assist=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"assist"]);
            [_dataDic setDictionary: @{
                        @"id":[message stringForColumn:@"id"],
                        @"date":[message stringForColumn:@"date"],
                        @"name":[message stringForColumn:@"name"],
                        @"offRebound":[message stringForColumn:@"offRebound"],
                        @"defRebound":[message stringForColumn:@"defRebound"],
                        @"assist":[message stringForColumn:@"assist"],
                        @"block":[message stringForColumn:@"block"],
                        @"steal":[message stringForColumn:@"steal"],
                        @"twoAttempt":[message stringForColumn:@"twoAttempt"],
                        @"twoMade":[message stringForColumn:@"twoMade"],
                        @"threeAttempt":[message stringForColumn:@"threeAttempt"],
                        @"threeMade":[message stringForColumn:@"threeMade"],
                        @"ftAttempt":[message stringForColumn:@"ftAttempt"],
                        @"ftMade":[message stringForColumn:@"ftMade"],
                        @"turnOver":[message stringForColumn:@"turnOver"],
                        @"foul":[message stringForColumn:@"foul"],
                        }];
            
        }
        [message close];
    }];
    
}
-(void)incAssist:(NSNumber *)id {
    
    int assist;
    assist = [[_dataDic objectForKey:@"assist"]intValue];
    assist++;
    [_dataDic setObject:[NSNumber numberWithInt:assist] forKey:@"assist"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET assist=?  WHERE id=?" ,[NSNumber numberWithInt:assist],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , assist FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ assist=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"assist"]);
            
        }
        [message close];
    }];
}
-(void)missFT:(NSNumber *)id {

}
-(void)madeFT:(NSNumber *)id {}
-(void)miss3pts:(NSNumber *)id {}
-(void)made3pts:(NSNumber *)id {}
-(void)miss2pts:(NSNumber *)id {}
-(void)made2pts:(NSNumber *)id {}
-(void)incDefRebound:(NSNumber *)id {}
-(void)incOffRebound:(NSNumber *)id {}

-(void)incSteal:(NSNumber *)id {}
-(void)incBlock:(NSNumber *)id {}
-(void)incTurnOver:(NSNumber *)id {}
-(void)incFoul:(NSNumber *)id {}
@end