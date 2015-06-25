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
@property (nonatomic, strong) UIButton *twoMadeBtn;
@property (nonatomic, strong) UIButton *twoMissBtn;
@property (nonatomic, strong) UIButton *threeMadeBtn;
@property (nonatomic, strong) UIButton *threeMissBtn;
@property (nonatomic, strong) UIButton *ftMadeBtn;
@property (nonatomic, strong) UIButton *ftMissBtn;
@property (nonatomic, strong) UIButton *assistBtn;
@property (nonatomic, strong) UIButton *offRebBtn;
@property (nonatomic, strong) UIButton *defRebBtn;
@property (nonatomic, strong) UIButton *stealBtn;
@property (nonatomic, strong) UIButton *blockBtn;
@property (nonatomic, strong) UIButton *turnOverBtn;
@property (nonatomic, strong) UIButton *foulBtn;

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
    if ([btn isEqual:_twoMadeBtn]) {
        [statsModel made2pts:[NSNumber numberWithInt:2]];
        [_pointLabel setText:[NSString stringWithFormat:@"%d pt",[(NSNumber*)[statsModel getStats:@"point"] intValue]]];
    }
    if ([btn isEqual:_twoMissBtn]) {
        [statsModel miss2pts:[NSNumber numberWithInt:2]];
        [_pointLabel setText:[NSString stringWithFormat:@"%d pt",[(NSNumber*)[statsModel getStats:@"point"] intValue]]];
    }
    if ([btn isEqual:_threeMadeBtn]) {
        [statsModel made3pts:[NSNumber numberWithInt:2]];
        [_pointLabel setText:[NSString stringWithFormat:@"%d pt",[(NSNumber*)[statsModel getStats:@"point"] intValue]]];
    }
    if ([btn isEqual:_threeMissBtn]) {
        [statsModel miss3pts:[NSNumber numberWithInt:2]];
        [_pointLabel setText:[NSString stringWithFormat:@"%d pt",[(NSNumber*)[statsModel getStats:@"point"] intValue]]];
    }
    if ([btn isEqual:_ftMadeBtn]) {
        [statsModel madeFT:[NSNumber numberWithInt:2]];
        [_pointLabel setText:[NSString stringWithFormat:@"%d pt",[(NSNumber*)[statsModel getStats:@"point"] intValue]]];
    }
    if ([btn isEqual:_ftMissBtn]) {
        [statsModel missFT:[NSNumber numberWithInt:2]];
        [_pointLabel setText:[NSString stringWithFormat:@"%d pt",[(NSNumber*)[statsModel getStats:@"point"] intValue]]];
    }
    if ([btn isEqual:_defRebBtn]) {
        [statsModel incDefRebound:[NSNumber numberWithInt:2]];
        [_reboundLabel setText:[NSString stringWithFormat:@"%d reb",[(NSNumber*)[statsModel getStats:@"rebound"] intValue]]];
    }
    if ([btn isEqual:_offRebBtn]) {
        [statsModel incOffRebound:[NSNumber numberWithInt:2]];
        [_reboundLabel setText:[NSString stringWithFormat:@"%d reb",[(NSNumber*)[statsModel getStats:@"rebound"] intValue]]];
    }
    if ([btn isEqual:_assistBtn]) {
        [statsModel incAssist:[NSNumber numberWithInt:2]];
        [_assistLabel setText:[NSString stringWithFormat:@"%d ast",[(NSNumber*)[statsModel getStats:@"assist"] intValue]]];
    }
    if ([btn isEqual:_stealBtn]) {
        [statsModel incSteal:[NSNumber numberWithInt:2]];
        [_stealLabel setText:[NSString stringWithFormat:@"%d stl",[(NSNumber*)[statsModel getStats:@"steal"] intValue]]];
    }
    if ([btn isEqual:_blockBtn]) {
        [statsModel incBlock:[NSNumber numberWithInt:2]];
        [_blockLabel setText:[NSString stringWithFormat:@"%d blk",[(NSNumber*)[statsModel getStats:@"block"] intValue]]];
    }
    if ([btn isEqual:_turnOverBtn]) {
        [statsModel incTurnOver:[NSNumber numberWithInt:2]];
        [_turnOverLabel setText:[NSString stringWithFormat:@"%d turnover",[(NSNumber*)[statsModel getStats:@"turnOver"] intValue]]];
    }
    if ([btn isEqual:_foulBtn]) {
        [statsModel incFoul:[NSNumber numberWithInt:2]];
        [_foulLabel setText:[NSString stringWithFormat:@"%d foul",[(NSNumber*)[statsModel getStats:@"foul"] intValue]]];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    statsModel = [StatsModel sharedInstance] ;
    //add an assist for stephen curry's game
    
    
    //layoutConstraints = [[NSMutableArray alloc] init];
    
    _twoMadeBtn = [[UIButton alloc] init];
    [_twoMadeBtn setBackgroundColor:[UIColor purpleColor]];
    [_twoMadeBtn setTitle:@"2 Points Made" forState:UIControlStateNormal];
    [_twoMadeBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _twoMadeBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_twoMadeBtn];
    _twoMissBtn = [[UIButton alloc] init];
    [_twoMissBtn setBackgroundColor:[UIColor purpleColor]];
    [_twoMissBtn setTitle:@"2 Points Miss" forState:UIControlStateNormal];
    [_twoMissBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _twoMissBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_twoMissBtn];
    _threeMadeBtn = [[UIButton alloc] init];
    [_threeMadeBtn setBackgroundColor:[UIColor purpleColor]];
    [_threeMadeBtn setTitle:@"3 Points Made" forState:UIControlStateNormal];
    [_threeMadeBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _threeMadeBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_threeMadeBtn];
    _threeMissBtn = [[UIButton alloc] init];
    [_threeMissBtn setBackgroundColor:[UIColor purpleColor]];
    [_threeMissBtn setTitle:@"3 Points Miss" forState:UIControlStateNormal];
    [_threeMissBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _threeMissBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_threeMissBtn];
    _ftMadeBtn = [[UIButton alloc] init];
    [_ftMadeBtn setBackgroundColor:[UIColor purpleColor]];
    [_ftMadeBtn setTitle:@"Free Throw Made" forState:UIControlStateNormal];
    [_ftMadeBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _ftMadeBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_ftMadeBtn];
    _ftMissBtn = [[UIButton alloc] init];
    [_ftMissBtn setBackgroundColor:[UIColor purpleColor]];
    [_ftMissBtn setTitle:@"Free Throw Miss" forState:UIControlStateNormal];
    [_ftMissBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _ftMissBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_ftMissBtn];

    
    _offRebBtn = [[UIButton alloc] init];
    [_offRebBtn setBackgroundColor:[UIColor purpleColor]];
    [_offRebBtn setTitle:@"Offence Rebound" forState:UIControlStateNormal];
    [_offRebBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _offRebBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_offRebBtn];
    _defRebBtn = [[UIButton alloc] init];
    [_defRebBtn setBackgroundColor:[UIColor purpleColor]];
    [_defRebBtn setTitle:@"Defence Rebound" forState:UIControlStateNormal];
    [_defRebBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _defRebBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_defRebBtn];
    
    _assistBtn = [[UIButton alloc] init];
    [_assistBtn setBackgroundColor:[UIColor purpleColor]];
    [_assistBtn setTitle:@"Assist" forState:UIControlStateNormal];
    [_assistBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _assistBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_assistBtn];

    
    
    
    _stealBtn = [[UIButton alloc] init];
    [_stealBtn setBackgroundColor:[UIColor purpleColor]];
    [_stealBtn setTitle:@"Steal" forState:UIControlStateNormal];
    [_stealBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _stealBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_stealBtn];

    
    _blockBtn = [[UIButton alloc] init];
    [_blockBtn setBackgroundColor:[UIColor purpleColor]];
    [_blockBtn setTitle:@"Block" forState:UIControlStateNormal];
    [_blockBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _blockBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_blockBtn];

    _turnOverBtn = [[UIButton alloc] init];
    [_turnOverBtn setBackgroundColor:[UIColor purpleColor]];
    [_turnOverBtn setTitle:@"Turn Over" forState:UIControlStateNormal];
    [_turnOverBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _turnOverBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_turnOverBtn];

    _foulBtn = [[UIButton alloc] init];
    [_foulBtn setBackgroundColor:[UIColor purpleColor]];
    [_foulBtn setTitle:@"Foul" forState:UIControlStateNormal];
    [_foulBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _foulBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_foulBtn];
    
    
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
    
    _stealLabel =[[UILabel alloc]init];
    [_stealLabel setBackgroundColor:[UIColor lightGrayColor]];
    [_stealLabel setText:[NSString stringWithFormat:@"%d stl",[(NSNumber *)[statsModel getStats:@"steal"]intValue]]];
    _stealLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_stealLabel];
    
    _blockLabel =[[UILabel alloc]init];
    [_blockLabel setBackgroundColor:[UIColor lightGrayColor]];
    [_blockLabel setText:[NSString stringWithFormat:@"%d blk",[(NSNumber *)[statsModel getStats:@"block"]intValue]]];
    _blockLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_blockLabel];
    
    _turnOverLabel =[[UILabel alloc]init];
    [_turnOverLabel setBackgroundColor:[UIColor lightGrayColor]];
    [_turnOverLabel setText:[NSString stringWithFormat:@"%d turnover",[(NSNumber *)[statsModel getStats:@"turnOver"]intValue]]];
    _turnOverLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_turnOverLabel];
    
    _foulLabel =[[UILabel alloc]init];
    [_foulLabel setBackgroundColor:[UIColor lightGrayColor]];
    [_foulLabel setText:[NSString stringWithFormat:@"%d foul",[(NSNumber *)[statsModel getStats:@"foul"]intValue]]];
    _foulLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_foulLabel];
    
    NSDictionary *objDictionary = NSDictionaryOfVariableBindings(_twoMadeBtn,_twoMissBtn,_threeMadeBtn,_threeMissBtn,_ftMadeBtn,_ftMissBtn,_defRebBtn,_offRebBtn,_assistBtn,_stealBtn,_blockBtn,_turnOverBtn,_foulBtn,_statsLabel,_dateLabel,_nameLabel,_pointLabel,_reboundLabel,_assistLabel,_stealLabel,_blockLabel,_turnOverLabel,_foulLabel);
    

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_twoMadeBtn(150)]-10-[_twoMissBtn(120)]" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_threeMadeBtn(150)]-10-[_threeMissBtn(120)]" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_ftMadeBtn(150)]-10-[_ftMissBtn(150)]" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_defRebBtn(150)]-10-[_offRebBtn(150)]" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_assistBtn(100)]" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_stealBtn(100)]-60-[_blockBtn(100)]" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_turnOverBtn(100)]-60-[_foulBtn(100)]" options:0 metrics:nil views:objDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_twoMadeBtn(40)]-10-[_threeMadeBtn(40)]-10-[_ftMadeBtn(40)]-10-[_defRebBtn(40)]-10-[_assistBtn(40)]-10-[_stealBtn(40)]-10-[_turnOverBtn(40)]" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_twoMissBtn(40)]-10-[_threeMissBtn(40)]-10-[_ftMissBtn(40)]-10-[_offRebBtn(40)]-60-[_blockBtn(40)]-10-[_foulBtn(40)]" options:0 metrics:nil views:objDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_statsLabel]|" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_dateLabel(100)][_nameLabel]|" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_pointLabel]-30-[_reboundLabel]-30-[_assistLabel]|" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_stealLabel]-30-[_blockLabel]|" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_turnOverLabel]-30-[_foulLabel]|" options:0 metrics:nil views:objDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_statsLabel(30)][_dateLabel(30)][_pointLabel(30)][_stealLabel(30)][_turnOverLabel(30)]|" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_statsLabel(30)][_nameLabel(30)][_reboundLabel(30)][_blockLabel(30)][_foulLabel(30)]|" options:0 metrics:nil views:objDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_statsLabel(30)][_nameLabel(30)][_assistLabel(30)]-60-|" options:0 metrics:nil views:objDictionary]];

    [self.view setBackgroundColor:[UIColor lightGrayColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
