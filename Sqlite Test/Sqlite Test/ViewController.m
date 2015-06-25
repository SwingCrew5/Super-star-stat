//
//  ViewController.m
//  Sqlite Test
//
//  Created by Wiser on 2015/6/8.
//  Copyright (c) 2015年 Wiser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableArray *layoutConstraints;
    StatsModel *statsModel;
}
@property (nonatomic, strong) UIButton *assistBtn;

@property (nonatomic, strong) UILabel  *statsLabel;
@property (nonatomic, strong) UILabel  *dateLabel;
@property (nonatomic, strong) UILabel  *nameLabel;
@property (nonatomic, strong) UILabel  *pointLabel;
@property (nonatomic, strong) UILabel  *assistLabel;
@property (nonatomic, strong) UILabel  *reboundLabel;
@property (nonatomic, strong) UILabel  *stealLabel;
@property (nonatomic, strong) UILabel  *blockLabel;
@property (nonatomic, strong) UILabel  *turnOverLabel;
@property (nonatomic, strong) UILabel  *foulLabel;
@property (strong)NSMutableDictionary * objDictionary;
@end

@implementation ViewController
- (void)addCustomizeConstraints:(NSArray *)newConstraints {
    [layoutConstraints addObjectsFromArray:newConstraints];
    [self.view addConstraints:layoutConstraints];
}

- (void)removeCustomizeConstraints {
    [self.view removeConstraints:layoutConstraints];
    [layoutConstraints removeAllObjects];
}
- (void)replaceCustomizeConstraints:(NSArray *)newConstraints {
    [self removeCustomizeConstraints];
    [self addCustomizeConstraints:newConstraints];
}
//- (void)updateViewConstraints {
//    [super updateViewConstraints];
//    NSMutableArray *constraints = [[NSMutableArray alloc] init];
//    NSDictionary *objDictionary = NSDictionaryOfVariableBindings(_assistBtn);
//    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_assistBtn(50)]" options:0 metrics:nil views:objDictionary]];
//    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_assistBtn(30)]" options:0 metrics:nil views:objDictionary]];
//    [self replaceCustomizeConstraints:constraints];
//}
-(void)btnClick:(UIButton *)btn{
    if ([btn isEqual:_assistBtn]) {
        [statsModel incAssist:[NSNumber numberWithInt:2]];
        [_assistLabel setText:[NSString stringWithFormat:@"%d ast",[(NSNumber*)[statsModel getStats:@"assist"] intValue]]];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    statsModel = [StatsModel sharedInstance] ;
    //add an assist for stephen curry's game
    
    
    //layoutConstraints = [[NSMutableArray alloc] init];
    
    _assistBtn = [[UIButton alloc] init];
    [_assistBtn setBackgroundColor:[UIColor purpleColor]];
    [_assistBtn setTitle:@"Assist" forState:UIControlStateNormal];
    [_assistBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _assistBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_assistBtn];
    

    _statsLabel =[[UILabel alloc]init];
    [_statsLabel setBackgroundColor:[UIColor lightGrayColor]];
    [_statsLabel setText:[NSString stringWithFormat:@"Statistics:"]];
    _statsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_statsLabel];
    

    _dateLabel =[[UILabel alloc]init];
    [_dateLabel setBackgroundColor:[UIColor lightGrayColor]];
    [_dateLabel setText:[NSString stringWithFormat:@"%@",(NSString*)[statsModel getStats:@"date"]]];
    _dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_dateLabel];
    
    _nameLabel =[[UILabel alloc]init];
    [_nameLabel setBackgroundColor:[UIColor lightGrayColor]];
    [_nameLabel setText:[NSString stringWithFormat:@"%@",(NSString*)[statsModel getStats:@"name"]]];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_nameLabel];
    
   
    _pointLabel =[[UILabel alloc]init];
    [_pointLabel setBackgroundColor:[UIColor lightGrayColor]];
    [_pointLabel setText:[NSString stringWithFormat:@"%d pt",[(NSNumber *)[statsModel getStats:@"point"]intValue]]];
    _pointLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_pointLabel];
    
    _reboundLabel =[[UILabel alloc]init];
    [_reboundLabel setBackgroundColor:[UIColor lightGrayColor]];
    [_reboundLabel setText:[NSString stringWithFormat:@"%d reb",[(NSNumber *)[statsModel getStats:@"rebound"]intValue]]];
    _reboundLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_reboundLabel];
    
    _assistLabel =[[UILabel alloc]init];
    [_assistLabel setBackgroundColor:[UIColor lightGrayColor]];
    [_assistLabel setText:[NSString stringWithFormat:@"%d ast",[(NSNumber *)[statsModel getStats:@"assist"]intValue]]];
    _assistLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_assistLabel];
    
    
    
    NSDictionary *objDictionary = NSDictionaryOfVariableBindings(_assistBtn,_statsLabel,_dateLabel,_nameLabel,_pointLabel,_reboundLabel,_assistLabel);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_assistBtn(60)]" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_assistBtn(40)]" options:0 metrics:nil views:objDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_statsLabel]|" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_dateLabel(100)][_nameLabel]|" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_pointLabel]-30-[_reboundLabel]-30-[_assistLabel]|" options:0 metrics:nil views:objDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_statsLabel(30)][_dateLabel(30)][_pointLabel(30)]|" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_statsLabel(30)][_nameLabel(30)][_assistLabel(30)]|" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_statsLabel(30)][_nameLabel(30)][_reboundLabel(30)]|" options:0 metrics:nil views:objDictionary]];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
