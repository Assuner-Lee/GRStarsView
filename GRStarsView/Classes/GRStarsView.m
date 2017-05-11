//
//  GRStarsView.m
//  GroooSource
//
//  Created by Assuner on 2017/5/10.
//  Copyright © 2017年 Assuner. All rights reserved.
//

#import "GRStarsView.h"
#import "GRStarView.h"

@interface GRStarsView ()

@property (nonatomic, strong) NSMutableArray *starViewArray;

@end

@implementation GRStarsView

- (instancetype)initWithStarSize:(CGSize)starSize margin:(CGFloat)margin numberOfStars:(NSInteger)number {
    if (self = [super init]) {
        _allowSelect = YES;
        _allowDecimal = YES;
        _starViewArray = [[NSMutableArray alloc] init];
        self.frame = CGRectMake(0, 0, starSize.width * number + margin * (number - 1), starSize.height);
        for (int i = 0; i < number; i ++) {
            GRStarView *starView = [[GRStarView alloc] initWithFrame:CGRectMake((starSize.width + margin) * i, 0, starSize.width, starSize.height)];
            starView.lightPercent = 1.0;
            starView.backgroundColor = [UIColor clearColor];
            [self addSubview:starView];
            [_starViewArray addObject:starView];
        }
    }
    return self;
}

- (void)setScore:(CGFloat)originalScore {
    _score = originalScore;
    if (originalScore > _starViewArray.count) {
        _score = _starViewArray.count;
    } else if (originalScore < 0) {
        _score = 0;
    }
    
    NSInteger wholeLightStarsCount = (NSInteger)_score;
    GRStarView *lastLightStarView = (wholeLightStarsCount == _starViewArray.count ? nil : _starViewArray[wholeLightStarsCount]);
    for (int i = 0; i < _starViewArray.count; i ++) {
        GRStarView *starView = _starViewArray[i];
        if (i < wholeLightStarsCount) {
            starView.lightPercent = 1.0;
        } else if (i > wholeLightStarsCount ) {
            starView.lightPercent = 0.0;
        } else {
            lastLightStarView.lightPercent = _score - wholeLightStarsCount;
        }
    }
    if (self.touchedActionBlock) {
        self.touchedActionBlock(_score);
    }
    
}

#pragma - HandleTouch

- (void)handleTouches:(NSSet *)touchs {
    if (!_allowSelect) {
        return;
    }
    
    UITouch *touch = [touchs anyObject];
    CGPoint locatedPoint = [touch locationInView:self];
    GRStarView *starView = nil;
    for (GRStarView * star in _starViewArray) {
        if (star.frame.origin.x <= locatedPoint.x && star.frame.origin.x + star.frame.size.width >= locatedPoint.x) {
            starView = star;
            break;
        }
    }
    if (!starView) {
        return;
    }
    _score = 0.0;
    NSInteger lastLightStarViewIndex = [_starViewArray indexOfObject:starView];
    for (int i = 0; i < _starViewArray.count; i ++ ) {
        GRStarView *star = _starViewArray[i];
        if (i < lastLightStarViewIndex) {
            star.lightPercent = 1.0;
            _score += 1.0;
        } else if (i > lastLightStarViewIndex) {
            star.lightPercent = 0.0;
        } else {
            if (_allowDecimal) {
                CGFloat lightPercent = (locatedPoint.x - star.frame.origin.x) / star.frame.size.width;
                _score += lightPercent;
                star.lightPercent = lightPercent;
            } else {
                _score += 1.0;
                star.lightPercent = 1.0;
            }
        }
        
    }
    _score = [NSString stringWithFormat:@"%.2f", _score].floatValue;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self handleTouches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (_allowDragSelect) {
         [self handleTouches:touches];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.touchedActionBlock) {
        self.touchedActionBlock(_score);
    }
}

@end
