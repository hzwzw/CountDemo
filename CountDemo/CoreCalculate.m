//
//  CoreCalculate.m
//  CountDemo
//
//  Created by mengjq on 5/3/14.
//  Copyright (c) 2014 Jianqiang Meng. All rights reserved.
//

#import "CoreCalculate.h"

@implementation CoreCalculate
static int teacherNum1;
static int teacherNum2;
static int teacherNum3;
static BOOL hasSetTeacherNum;
+ (BOOL)setTeacherNum:(unsigned int)num1 andNum2:(unsigned int)num2 andNum3:(unsigned int)num3
{
    if ((num1==0)||(num1>9)) {
        return false;
    }
    if ((num2==0)||(num2>9)) {
        return false;
    }
    if ((num3==0)||(num3>9)) {
        return false;
    }
    if (!((num1^num2)&&(num2^num3)&&(num1^num3))) {
        return false;
    }
    teacherNum1=num1;
    teacherNum2=num2;
    teacherNum3=num3;
    hasSetTeacherNum = true;
    return true;
}

+ (void)clearTeacherNums
{
    hasSetTeacherNum = false;
}
+ (NSString *)getCountResult:(unsigned int)studentIndex;
{
    if (!hasSetTeacherNum) {
        NSException *e = [NSException
                          exceptionWithName: @"NoTeacherNumException"
                          reason: @"you have not set teacher numbers"
                          userInfo: nil];
        @throw e;
    } else if ( studentIndex ==0 ) {
        NSException *e = [NSException
                          exceptionWithName: @"StackOverflowException"
                          reason: @"the teacher index should't be 0"
                          userInfo: nil];
        @throw e;
    }
    
    NSString *str = @"";
    NSString *string = [NSString stringWithFormat:@"%d",studentIndex];
    if ([string rangeOfString:[NSString stringWithFormat:@"%d",teacherNum1]].location != NSNotFound)
    {
        str=[str stringByAppendingString:@"Fizz"];
        return str;
    }
    if(!(studentIndex%teacherNum1))
        str=[str stringByAppendingString:@"Fizz"];
    if(!(studentIndex%teacherNum2))
        str=[str stringByAppendingString:@"Buzz"];
    if(!(studentIndex%teacherNum3))
        str=[str stringByAppendingString:@"Whizz"];
    if(![str length])
        str = [NSString stringWithFormat:@"%d",studentIndex];
    return str;
}

@end
