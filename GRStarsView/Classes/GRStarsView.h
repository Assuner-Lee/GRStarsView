//
//  GRStarsView.h
//  GroooSource
//
//  Created by Assuner on 2017/5/10.
//  Copyright © 2017年 Assuner. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void (^GRTouchedActionBlock)(CGFloat score);

@interface GRStarsView : UIView

@property (nonatomic, assign) BOOL allowSelect;
@property (nonatomic, assign) CGFloat score;
@property (nonatomic, assign) BOOL allowDecimal;
@property (nonatomic, assign) BOOL allowDragSelect;

@property (nonatomic, copy) GRTouchedActionBlock touchedActionBlock;

- (instancetype)initWithStarSize:(CGSize)size margin:(CGFloat)margin numberOfStars:(NSInteger)number;

@end
