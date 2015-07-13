//
//  StatsModel.h
//  Sqlite Test
//
//  Created by Wiser on 2015/6/12.
//  Copyright (c) 2015年 Wiser. All rights reserved.
//

@interface StatsModel : NSThread  

+ (id)sharedInstance;
@property (nonatomic) int gameID;
@property (nonatomic) NSMutableDictionary *dataDic;
-(NSObject*)getStats:(NSString*)type;
-(void)loadDataFromDB:(NSNumber *)id;
-(void)incAssist:(NSNumber *)id ;
-(void)missFT:(NSNumber *)id ;
-(void)madeFT:(NSNumber *)id ;
-(void)miss3pts:(NSNumber *)id ;
-(void)made3pts:(NSNumber *)id ;
-(void)miss2pts:(NSNumber *)id ;
-(void)made2pts:(NSNumber *)id ;
-(void)incDefRebound:(NSNumber *)id ;
-(void)incOffRebound:(NSNumber *)id ;

-(void)incSteal:(NSNumber *)id ;
-(void)incBlock:(NSNumber *)id ;
-(void)incTurnOver:(NSNumber *)id ;
-(void)incFoul:(NSNumber *)id ;
-(void)nextGame;
@end