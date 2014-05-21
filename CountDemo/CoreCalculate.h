//
//  CoreCalculate.h
//  CountDemo
//
//  Created by mengjq on 5/3/14.
//  Copyright (c) 2014 Jianqiang Meng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreCalculate : NSObject
/**
 *  设置老师的三个特殊数
 *
 *  @param num1 第一个特殊数
 *  @param num2 第二个特殊数
 *  @param num3 第三个特殊数
 *
 *  @return 设置是否成功
 */
+ (BOOL)setTeacherNum:(unsigned int)num1 andNum2:(unsigned int)num2 andNum3:(unsigned int)num3;
/**
 *  清空老师设置地特殊数
 */
+ (void)clearTeacherNums;
/**
 *  通过该学生在队列中的位置得到该报什么数
 *
 *  @param studentIndex 某学生在队列中的位置
 *
 *  @return 该学生应该报的数
 */
+ (NSString *)getCountResult:(unsigned int)studentIndex;
@end
