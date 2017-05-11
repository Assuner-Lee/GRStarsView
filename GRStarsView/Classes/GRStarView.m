//
//  GRStarView.m
//  GroooSource
//
//  Created by Assuner on 2017/5/10.
//  Copyright © 2017年 Assuner. All rights reserved.
//

#import "GRStarView.h"

@interface GRStarView ()

@property (nonatomic, strong) UIImage *prayStarImg;
@property (nonatomic, strong) UIImage *lightStarImg;

@end


@implementation GRStarView

- (UIImage *)prayStarImg {
    if (!_prayStarImg) {
        _prayStarImg = [self imageNamed:@"pray_star"];
    }
    return _prayStarImg;
}

- (UIImage *)lightStarImg {
    if (!_lightStarImg) {
        _lightStarImg = [self imageNamed:@"light_star"];
    }
    return _lightStarImg;
}

- (void)setLightPercent:(CGFloat)lightPercent {
    _lightPercent = lightPercent;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (_lightPercent == 1) {
        [self.lightStarImg drawInRect:rect];
        return;
    }
    if (_lightPercent == 0) {
        [self.prayStarImg drawInRect:rect];
        return;
    }
    
    CGFloat lightWidth = rect.size.width * _lightPercent;
    CGFloat prayWidth = rect.size.width - lightWidth;
    
    UIImage *leftImg = [self croppedImgWithImg:self.lightStarImg percent:_lightPercent fromLeft:YES];
    UIImage *rightImg = [self croppedImgWithImg:self.prayStarImg percent:(1 - _lightPercent) fromLeft:NO];
    
    [leftImg drawInRect:CGRectMake(0, 0, lightWidth, rect.size.height)];
    [rightImg drawInRect:CGRectMake(lightWidth, 0, prayWidth, rect.size.height)];
}

- (UIImage *)croppedImgWithImg:(UIImage *)img percent:(CGFloat)percent fromLeft:(BOOL)isfromLeft {
    CGSize imgSize = img.size;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imgSize.width * percent, imgSize.height), NO, 0);
    if (isfromLeft) {
        [img drawAtPoint:CGPointMake(0, 0)];
    } else {
        [img drawAtPoint:CGPointMake(imgSize.width * percent - imgSize.width, 0)];
    }
    UIImage *croppedImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return croppedImg;
}

- (UIImage *)imageNamed:(NSString *)name {
    return [UIImage imageNamed:name inBundle:[NSBundle bundleWithPath:[NSString stringWithFormat:@"%@/GRStarsView.bundle", [NSBundle bundleForClass:self.class].resourcePath]] compatibleWithTraitCollection:nil];
}

@end
