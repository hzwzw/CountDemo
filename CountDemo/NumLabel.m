//
//  NumLabel.m
//  CountDemo
//
//  Created by mengjq on 5/3/14.
//  Copyright (c) 2014 Jianqiang Meng. All rights reserved.
//

#import "NumLabel.h"

@implementation NumLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)setChooseIndex:(NSInteger)chooseIndex
{
    _chooseIndex = chooseIndex;
    if (chooseIndex) {
        _originPoint = [self center];
    }
}

@end
