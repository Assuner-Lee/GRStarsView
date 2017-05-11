//
//  GRViewController.m
//  GRStarsView
//
//  Created by Assuner-Lee on 05/11/2017.
//  Copyright (c) 2017 Assuner-Lee. All rights reserved.
//

#import "GRViewController.h"
#import <GRStarsView/GRStarsView.h>

@interface GRViewController ()

@property (weak, nonatomic) IBOutlet UIView *starsBaseView1;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel1;
@property (weak, nonatomic) IBOutlet UIView *starsBaseView2;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel2;
@property (weak, nonatomic) IBOutlet UIView *starsBaseView3;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel3;
@property (weak, nonatomic) IBOutlet UIView *starsBaseView4;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel4;
@property (weak, nonatomic) IBOutlet UIView *starsBaseView5;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel5;



@end

@implementation GRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 为了方便演示，我们把starsView贴在了xib的某个定好位置的view上，starView的默认frame.orign为(0,0), size是自动生成的;
    //(默认支持点击，小数)
    
    GRStarsView *starsView1 = [[GRStarsView alloc] initWithStarSize:CGSizeMake(30, 30) margin:10 numberOfStars:5];
    starsView1.allowSelect = NO;
    starsView1.score = 4.5;
    self.infoLabel1.text = [NSString stringWithFormat:@"(不可点击) 分数: %.1f", starsView1.score];
    [self.starsBaseView1 addSubview:starsView1];
    
    GRStarsView *starsView2 = [[GRStarsView alloc] initWithStarSize:CGSizeMake(30, 30) margin:10 numberOfStars:5];
    starsView2.allowDecimal = NO;
    starsView2.touchedActionBlock = ^(CGFloat score) {
        self.infoLabel2.text = [NSString stringWithFormat:@"(可点击，不支持小数) 分数: %.1f", score]; // 点击或拖动打分 后的回调;
    };
    starsView2.score = 4.0;
    [self.starsBaseView2 addSubview:starsView2];
    
    GRStarsView *starsView3 = [[GRStarsView alloc] initWithStarSize:CGSizeMake(30, 30) margin:10 numberOfStars:5];
    starsView3.allowDecimal = YES;
    starsView3.touchedActionBlock = ^(CGFloat score) {
        self.infoLabel3.text = [NSString stringWithFormat:@"(可点击，支持小数) 分数: %.1f", score];
    };
    starsView3.score = 4.5;
    [self.starsBaseView3 addSubview:starsView3];
    
    GRStarsView *starsView4 = [[GRStarsView alloc] initWithStarSize:CGSizeMake(30, 30) margin:10 numberOfStars:5];
    starsView4.allowDecimal = NO;
    starsView4.allowDragSelect = YES;
    starsView4.touchedActionBlock = ^(CGFloat score) {
        self.infoLabel4.text = [NSString stringWithFormat:@"(可点击,拖动，不支持小数) 分数: %.1f", score];
    };
    starsView4.score = 4.0;
    [self.starsBaseView4 addSubview:starsView4];
    
    GRStarsView *starsView5 = [[GRStarsView alloc] initWithStarSize:CGSizeMake(30, 30) margin:10 numberOfStars:5];
    starsView5.allowDragSelect = YES;
    starsView5.touchedActionBlock = ^(CGFloat score) {
        self.infoLabel5.text = [NSString stringWithFormat:@"(可点击,拖动，支持小数) 分数: %.1f", score];
    };
    starsView5.score = 4.5;
    [self.starsBaseView5 addSubview:starsView5];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
