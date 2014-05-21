//
//  ViewController.m
//  CountDemo
//
//  Created by mengjq on 5/3/14.
//  Copyright (c) 2014 Jianqiang Meng. All rights reserved.
//

#import "ViewController.h"
#import <POP.h>
#import "NumLabel.h"
#import "CoreCalculate.h"

@interface ViewController ()
{
    BOOL showTextView;
    NSMutableArray *chooseArray;
    __weak IBOutlet UITextView *countResultTextView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    chooseArray = [[NSMutableArray alloc]initWithObjects:@0,@0,@0,nil];
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[NumLabel class]]) {
            NumLabel *label = (NumLabel *)view;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(popAnimation:)];
            [label addGestureRecognizer:tap];
        }
    }
}
- (void)popAnimation:(UIGestureRecognizer *)gesture
{
    NumLabel *label = (NumLabel *)gesture.view;
    NSInteger isChanged = [label chooseIndex];
    if ([self allChoosed]&&(!isChanged)) {
        return;
    }
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGPoint:isChanged?CGPointMake(1.0, 1.0):CGPointMake(1.5, 1.5)];
    [label.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    CGPoint toPoint = [label originPoint];
    if (!isChanged) {
        int index =[self readyChooedIndex];
        switch (index) {
            case 1:
            {
                toPoint =CGPointMake(60, 150);
                break;
            }
            case 2:
            {
                toPoint =CGPointMake(160, 150);
                break;
            }
            case 3:
            {
                toPoint =CGPointMake(260, 150);
                break;
            }
            default:
                break;
        }
        [label setChooseIndex:index];
        chooseArray[index-1] = @([label.text intValue]);
    }else
    {
        chooseArray[[label chooseIndex]-1] = @0;
        [label setChooseIndex:0];
    }
    
    positionAnimation.toValue = [NSValue valueWithCGPoint:toPoint];
    positionAnimation.springBounciness = 15.0f;
    [label.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    POPSpringAnimation *colorAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
    UIColor *color =isChanged?[UIColor greenColor]:[UIColor redColor];
    colorAnimation.toValue = (id)color.CGColor;
    [label pop_addAnimation:colorAnimation forKey:@"colorAnimation"];
}

- (void)textPopAnimation
{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGPoint:showTextView?CGPointMake(1.0, 1.0):CGPointMake(0.6, 0.6)];
    scaleAnimation.springBounciness = 15.0f;
    [countResultTextView.superview.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    float alpha = showTextView?1.0f:0.0f;
    POPSpringAnimation *alphaAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alphaAnimation.toValue = [NSNumber numberWithFloat:alpha];
    [countResultTextView.superview pop_addAnimation:alphaAnimation forKey:@"alphaAnimation"];
}
- (BOOL)allChoosed
{
    return [chooseArray[0] integerValue]&&[chooseArray[1] integerValue]&&[chooseArray[2] integerValue];
}

- (NSInteger)readyChooedIndex
{
    if (![chooseArray[0] integerValue]) {
        return 1;
    }
    if (![chooseArray[1] integerValue]) {
        return 2;
    }
    if (![chooseArray[2] integerValue]) {
        return 3;
    }
    return 100;
}

#pragma mark uibutton
- (IBAction)startCount:(id)sender {
    if ([self allChoosed]) {
        showTextView = YES;
        int studentIndex = 1;
        [CoreCalculate setTeacherNum:[chooseArray[0] integerValue] andNum2:[chooseArray[1] integerValue] andNum3:[chooseArray[2] integerValue]];
        NSString *str = @"";
        while (101-studentIndex) {
            [CoreCalculate getCountResult:studentIndex];
            str = [str stringByAppendingString:[NSString stringWithFormat:@"%@\n",[CoreCalculate getCountResult:studentIndex]]];
            studentIndex++;
        }
        countResultTextView.text = str;
        [self textPopAnimation];
        ;
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please choose three numbers" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}
- (IBAction)closeCountView:(id)sender {
    showTextView = false;
    [self textPopAnimation];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end