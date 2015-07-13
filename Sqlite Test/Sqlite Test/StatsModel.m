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
        _gameID=2;
        assist=15;
        [self loadDataFromDB:[NSNumber numberWithInt:_gameID]];
        //Access DB in Data Model , it should refined as functions
        DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
        //Drop Table
//        [dbAgent inDatabase:^(FMDatabase *db) {
//            [db executeUpdate:@"DROP TABLE SuperStarStats"];
//        }];
//        //Create Table SuperStarStats
//        [dbAgent inDatabase:^(FMDatabase *db) {
//            [db executeUpdate:@"CREATE TABLE IF NOT EXISTS SuperStarStats( id INTEGER PRIMARY KEY, date TEXT , name TEXT , block INTEGER,defRebound INTEGER, assist INTEGER , block INTEGER , steal INTEGER ,twoAttempt INTEGER , twoMade INTEGER , threeAttempt INTEGER , threeMade INTEGER , threeAttempt INTEGER, ftMade INTEGER ,foul INTEGER,foul INTEGER)"];
//        }];
//
//         
//         //Insert records
//         [dbAgent inDatabase:^(FMDatabase *db) {
//             [db executeUpdate:@"INSERT INTO SuperStarStats( id , date , name  , offRebound  , defRebound , assist  , block  , steal  , twoAttempt  , twoMade  , threeAttempt  , threeMade  , ftAttempt  , ftMade  , turnOver , foul ) VALUES(1 , '2015-06-07' , 'Lebron James' , 3 , 7 , 11 , 1 , 1 , 20 , 10 , 10 , 4 , 15 ,  12 , 2 , 3 )"];
//             [db executeUpdate:@"INSERT INTO SuperStarStats ( id , date , name  , offRebound  , defRebound , assist  , block  , steal  , twoAttempt  , twoMade  , threeAttempt  , threeMade  , ftAttempt  , ftMade  , turnOver , foul ) VALUES(2 , '2015-06-09' , 'Stephen Curry' , 1 , 4 , ? , 0 , 3 , 15 , 10 , 12 , 5 , 10 ,  9 , 1 , 2 )" , [NSNumber numberWithInt:assist]];
//         }];
//
//         //Read/Query records
//         [dbAgent inDatabase:^(FMDatabase *db) {
//         FMResultSet *message = [db executeQuery:@"SELECT date, name , assist FROM SuperStarStats"];
//         while ([message next]){
//             NSLog(@"\n%@ %@ assist=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"assist"]);
//         
//         }
//         [message close];
//         }];
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
         [dbAgent inDatabase:^(FMDatabase *db){
         FMResultSet *message = [db executeQuery:@"SELECT date, name,assist FROM SuperStarStats"];
         while ([message next]){
             NSLog(@"%@ %@ assist=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"assist"]);
         
         }
         [message close];
         }];
    }
    return self;
}
- (void)dealloc {
    // 永遠不被執行
}
- (void)main {
    
}
-(NSObject*)getStats:(NSString*)type{
    if([type isEqualToString:@"date"])
       return  [_dataDic objectForKey:type];
    else if([type isEqualToString:@"name"])
       return  [_dataDic objectForKey:type];
    else if([type isEqualToString:@"point"])
       return [NSNumber numberWithInt:[[_dataDic objectForKey:@"twoMade"]intValue]*2+
                                      [[_dataDic objectForKey:@"threeMade"]intValue]*3+
                                      [[_dataDic objectForKey:@"ftMade"]intValue]];
    else if([type isEqualToString:@"rebound"])
        return [NSNumber numberWithInt:[[_dataDic objectForKey:@"offRebound"]intValue]+
                [[_dataDic objectForKey:@"defRebound"]intValue]];
    else if([type isEqualToString:@"assist"])
        return [NSNumber numberWithInt:[[_dataDic objectForKey:type]intValue]];
    else if([type isEqualToString:@"steal"])
        return [NSNumber numberWithInt:[[_dataDic objectForKey:type]intValue]];
    else if([type isEqualToString:@"block"])
        return [NSNumber numberWithInt:[[_dataDic objectForKey:type]intValue]];
    else if([type isEqualToString:@"turnOver"])
        return [NSNumber numberWithInt:[[_dataDic objectForKey:type]intValue]];
    else if([type isEqualToString:@"foul"])
        return [NSNumber numberWithInt:[[_dataDic objectForKey:type]intValue]];
    
    return @"";
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
    int ftAttempt;
    ftAttempt = [[_dataDic objectForKey:@"ftAttempt"]intValue];
    ftAttempt++;
    [_dataDic setObject:[NSNumber numberWithInt:ftAttempt] forKey:@"ftAttempt"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET ftAttempt=?  WHERE id=?" ,[NSNumber numberWithInt:ftAttempt],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , ftAttempt FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ ftAttempt=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"ftAttempt"]);
            
        }
        [message close];
    }];
}
-(void)madeFT:(NSNumber *)id {
    int ftMade;
    ftMade = [[_dataDic objectForKey:@"ftMade"]intValue];
    ftMade++;
    [_dataDic setObject:[NSNumber numberWithInt:ftMade] forKey:@"ftMade"];
    
    int ftAttempt;
    ftAttempt = [[_dataDic objectForKey:@"ftAttempt"]intValue];
    ftAttempt++;
    [_dataDic setObject:[NSNumber numberWithInt:ftAttempt] forKey:@"ftAttempt"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET ftMade=? , ftAttempt=? WHERE id=?" ,[NSNumber numberWithInt:ftMade],[NSNumber numberWithInt:ftAttempt],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , ftMade , ftAttempt  FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ ftMade=%@ ftAttempt=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"ftMade"],[message stringForColumn:@"ftAttempt"]);
            
        }
        [message close];
    }];

}
-(void)miss3pts:(NSNumber *)id {
    int threeAttempt;
    threeAttempt = [[_dataDic objectForKey:@"threeAttempt"]intValue];
    threeAttempt++;
    [_dataDic setObject:[NSNumber numberWithInt:threeAttempt] forKey:@"threeAttempt"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET threeAttempt=?  WHERE id=?" ,[NSNumber numberWithInt:threeAttempt],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , threeAttempt FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ threeAttempt=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"threeAttempt"]);
            
        }
        [message close];
    }];
}
-(void)made3pts:(NSNumber *)id {
    int threeMade;
    threeMade = [[_dataDic objectForKey:@"threeMade"]intValue];
    threeMade++;
    [_dataDic setObject:[NSNumber numberWithInt:threeMade] forKey:@"threeMade"];
    
    int threeAttempt;
    threeAttempt = [[_dataDic objectForKey:@"threeAttempt"]intValue];
    threeAttempt++;
    [_dataDic setObject:[NSNumber numberWithInt:threeAttempt] forKey:@"threeAttempt"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET threeMade=? , threeAttempt=? WHERE id=?" ,[NSNumber numberWithInt:threeMade],[NSNumber numberWithInt:threeAttempt],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , threeMade , threeAttempt  FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ threeMade=%@ threeAttempt=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"threeMade"],[message stringForColumn:@"threeAttempt"]);
            
        }
        [message close];
    }];
}
-(void)miss2pts:(NSNumber *)id {
    int twoAttempt;
    twoAttempt = [[_dataDic objectForKey:@"twoAttempt"]intValue];
    twoAttempt++;
    [_dataDic setObject:[NSNumber numberWithInt:twoAttempt] forKey:@"twoAttempt"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET twoAttempt=?  WHERE id=?" ,[NSNumber numberWithInt:twoAttempt],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , twoAttempt FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ twoAttempt=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"twoAttempt"]);
            
        }
        [message close];
    }];
}
-(void)made2pts:(NSNumber *)id {
    int twoMade;
    twoMade = [[_dataDic objectForKey:@"twoMade"]intValue];
    twoMade++;
    [_dataDic setObject:[NSNumber numberWithInt:twoMade] forKey:@"twoMade"];
    
    int twoAttempt;
    twoAttempt = [[_dataDic objectForKey:@"twoAttempt"]intValue];
    twoAttempt++;
    [_dataDic setObject:[NSNumber numberWithInt:twoAttempt] forKey:@"twoAttempt"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET twoMade=? , twoAttempt=? WHERE id=?" ,[NSNumber numberWithInt:twoMade],[NSNumber numberWithInt:twoAttempt],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , twoMade , twoAttempt  FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ twoMade=%@ twoAttempt=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"twoMade"],[message stringForColumn:@"twoAttempt"]);
            
        }
        [message close];
    }];
}
-(void)incDefRebound:(NSNumber *)id {
    int defRebound;
    defRebound = [[_dataDic objectForKey:@"defRebound"]intValue];
    defRebound++;
    [_dataDic setObject:[NSNumber numberWithInt:defRebound] forKey:@"defRebound"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET defRebound=?  WHERE id=?" ,[NSNumber numberWithInt:defRebound],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , defRebound FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ defRebound=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"defRebound"]);
            
        }
        [message close];
    }];
}
-(void)incOffRebound:(NSNumber *)id {
    int offRebound;
    offRebound = [[_dataDic objectForKey:@"offRebound"]intValue];
    offRebound++;
    [_dataDic setObject:[NSNumber numberWithInt:offRebound] forKey:@"offRebound"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET offRebound=?  WHERE id=?" ,[NSNumber numberWithInt:offRebound],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , offRebound FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ offRebound=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"offRebound"]);
            
        }
        [message close];
    }];

}

-(void)incSteal:(NSNumber *)id {
    int steal;
    steal = [[_dataDic objectForKey:@"steal"]intValue];
    steal++;
    [_dataDic setObject:[NSNumber numberWithInt:steal] forKey:@"steal"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET steal=?  WHERE id=?" ,[NSNumber numberWithInt:steal],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , steal FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ steal=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"steal"]);
            
        }
        [message close];
    }];
}
-(void)incBlock:(NSNumber *)id {
    int block;
    block = [[_dataDic objectForKey:@"block"]intValue];
    block++;
    [_dataDic setObject:[NSNumber numberWithInt:block] forKey:@"block"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET block=?  WHERE id=?" ,[NSNumber numberWithInt:block],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , block FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ block=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"block"]);
            
        }
        [message close];
    }];
}
-(void)incTurnOver:(NSNumber *)id {
    int turnOver;
    turnOver = [[_dataDic objectForKey:@"turnOver"]intValue];
    turnOver++;
    [_dataDic setObject:[NSNumber numberWithInt:turnOver] forKey:@"turnOver"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET turnOver=?  WHERE id=?" ,[NSNumber numberWithInt:turnOver],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , turnOver FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ turnOver=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"turnOver"]);
            
        }
        [message close];
    }];
}
-(void)incFoul:(NSNumber *)id {
    int foul;
    foul = [[_dataDic objectForKey:@"foul"]intValue];
    foul++;
    [_dataDic setObject:[NSNumber numberWithInt:foul] forKey:@"foul"];
    
    //Access DB in Data Model , it should refined as functions
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE SuperStarStats SET foul=?  WHERE id=?" ,[NSNumber numberWithInt:foul],id];
    }];
    
    //Read/Query records
    [dbAgent inDatabase:^(FMDatabase *db) {
        FMResultSet *message = [db executeQuery:@"SELECT date, name , foul FROM SuperStarStats"];
        while ([message next]){
            NSLog(@"\n%@ %@ foul=%@\n",[message stringForColumn:@"date"],[message stringForColumn:@"name"],[message stringForColumn:@"foul"]);
            
        }
        [message close];
    }];
}
-(void)nextGame{
    NSLog(@"next game\n");
    DBAgent* dbAgent = [[DBAgent alloc]initWithPath:@""];
    //Insert records
    [dbAgent inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"INSERT INTO SuperStarStats( date , name  , offRebound  , defRebound , assist  , block  , steal  , twoAttempt  , twoMade  , threeAttempt  , threeMade  , ftAttempt  , ftMade  , turnOver , foul ) VALUES( '2015-07-13' , 'Lebron James' , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,  0 , 0 , 0 )"];
        FMResultSet *message = [db executeQuery:@"SELECT id FROM SuperStarStats WHERE id = (SELECT MAX(id) FROM SuperStarStats)"];
        while ([message next]){
            NSLog(@"id=%@\n",[message stringForColumn:@"id"]);
            
        }
        _gameID=[[message stringForColumn:@"id"]intValue];
        [message close];
            
    }];
    
}
@end