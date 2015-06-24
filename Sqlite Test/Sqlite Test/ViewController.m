//
//  ViewController.m
//  Sqlite Test
//
//  Created by Wiser on 2015/6/8.
//  Copyright (c) 2015年 Wiser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    StatsModel *statsModel;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    statsModel = [StatsModel sharedInstance] ;
    //add an assist for stephen curry's game
    [statsModel incAssist:[NSNumber numberWithInt:2]];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
