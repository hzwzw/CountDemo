//
//  CountDemoCalculateTests.m
//  CountDemo
//
//  Created by mengjq on 5/3/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CoreCalculate.h"
/**
 *  主要测试输出地报数结果是否正确
 */
@interface CountDemoCalculateTests : XCTestCase

@end

@implementation CountDemoCalculateTests

- (void)setUp
{
    [super setUp];
    [CoreCalculate setTeacherNum:1 andNum2:2 andNum3:4];
    [CoreCalculate setTeacherNum:3 andNum2:6 andNum3:9];
    [CoreCalculate clearTeacherNums];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNormalNums
{
    [CoreCalculate setTeacherNum:3 andNum2:5 andNum3:7];
    XCTAssertEqualObjects(@"1", [CoreCalculate getCountResult:1], @"should return '1' when index=1");
    XCTAssertEqualObjects(@"Fizz", [CoreCalculate getCountResult:3], @"should return 'Fizz' when index=3");
    XCTAssertEqualObjects(@"Buzz", [CoreCalculate getCountResult:5], @"should return 'Buzz' when index=5");
    XCTAssertEqualObjects(@"Whizz", [CoreCalculate getCountResult:7], @"should return 'Whizz' when index=7");
    XCTAssertEqualObjects(@"FizzBuzz", [CoreCalculate getCountResult:15], @"should return 'FizzBuzz' when index=15");
    XCTAssertEqualObjects(@"FizzWhizz", [CoreCalculate getCountResult:21], @"should return 'FizzWhizz' when index=21");
    XCTAssertEqualObjects(@"Fizz", [CoreCalculate getCountResult:35], @"should return 'Fizz' when index=35");
    XCTAssertEqualObjects(@"97", [CoreCalculate getCountResult:97], @"should return '97' when index=97");
    XCTAssertEqualObjects(@"Buzz", [CoreCalculate getCountResult:100], @"should return 'Buzz' when index=100");
}

- (void)testMultipleNums
{
    [CoreCalculate setTeacherNum:1 andNum2:2 andNum3:4];
    XCTAssertEqualObjects(@"Fizz", [CoreCalculate getCountResult:1], @"should return 'Fizz' when index=1");
    XCTAssertEqualObjects(@"FizzBuzz", [CoreCalculate getCountResult:2], @"should return 'FizzBuzz' when index=2");
    XCTAssertEqualObjects(@"FizzBuzzWhizz", [CoreCalculate getCountResult:4], @"should return 'FizzBuzzWhizz' when index=4");
    XCTAssertEqualObjects(@"Fizz", [CoreCalculate getCountResult:16], @"should return 'Fizz' when index=16");
    XCTAssertEqualObjects(@"FizzBuzz", [CoreCalculate getCountResult:62], @"should return 'FizzBuzz' when index=62");
    XCTAssertEqualObjects(@"Fizz", [CoreCalculate getCountResult:71], @"should return 'Fizz' when index=71");
    XCTAssertEqualObjects(@"Fizz", [CoreCalculate getCountResult:99], @"should return 'Fizz' when index=99");
}
@end
