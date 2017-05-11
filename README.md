# GRStarsView

[![CI Status](http://img.shields.io/travis/Assuner-Lee/GRStarsView.svg?style=flat)](https://travis-ci.org/Assuner-Lee/GRStarsView)
[![Version](https://img.shields.io/cocoapods/v/GRStarsView.svg?style=flat)](http://cocoapods.org/pods/GRStarsView)
[![License](https://img.shields.io/cocoapods/l/GRStarsView.svg?style=flat)](http://cocoapods.org/pods/GRStarsView)
[![Platform](https://img.shields.io/cocoapods/p/GRStarsView.svg?style=flat)](http://cocoapods.org/pods/GRStarsView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

GRStarsView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GRStarsView"
```
# 先看效果

![](http://upload-images.jianshu.io/upload_images/4133010-c9d931b71a4d866c.gif?imageMogr2/auto-orient/strip)
# 使用
#### 1. 初始化一个GRStarsView
```
GRStarsView *starsView = [[GRStarsView alloc] initWithStarSize:CGSizeMake(30, 30) margin:10 numberOfStars:5];
```
初始化了星星的尺寸，间距和个数；
此时starsView的默认origin为(0, 0);
#### *2. 设置frame ，并添加到某一个视图上

```
starsView.frame = CGRectMake(50, 100, starsView.frame.size.width, starsView.frame.size.width);
```
```
[view addSubview:starsView]; //view为某个视图
```
#### 3. 配置属性(可否点击、拖动评分，是否允许小数显示)
```
 starsView.allowSelect = YES;  // 默认可点击
 starsView.allowDecimal = YES;  //默认可显示小数
 starsView.allowDragSelect = NO;//默认不可拖动评分，可拖动下需可点击才有效
```
#### 4.  配置触摸(点击，拖动)结束 score改变后的block回调
```
starsView.touchedActionBlock = ^(CGFloat score) {
        infoLabel.text = [NSString stringWithFormat:@" 分数: %.1f", score];
```
其中，默认返回的score精确到两位。
#### *设置score，可绘出星星评分
```
starsView.score = 4.5;
```
(若在此之前设置了回调block，会触发一次回调)
# 谢谢观看，如有错误，请多指正。
## Author

Assuner-Lee, assuner@foxmail.com

## License

GRStarsView is available under the MIT license. See the LICENSE file for more info.
