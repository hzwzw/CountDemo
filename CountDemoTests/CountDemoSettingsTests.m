//
//  CountDemoTests.m
//  CountDemoTests
//
//  Created by mengjq on 5/3/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CoreCalculate.h"
/**
 *  主要测试老师地特殊数是否符合要求及报数流程
 */
@interface CountDemoSettingsTests : XCTestCase

@end

@implementation CountDemoSettingsTests

- (void)setUp
{
    [super setUp];
    [CoreCalculate clearTeacherNums];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetCount_WithOutSettingTeacherNum
{
    XCTAssertThrowsSpecificNamed([CoreCalculate getCountResult:1], NSException, @"NoTeacherNumException", @"should throw exception");
}

- (void)testSettingTeacherNum_WithWrongFormat_downBorder
{
    BOOL success = [CoreCalculate setTeacherNum:0 andNum2:2 andNum3:9];
    XCTAssertFalse(success, @"should not success when teacher number<1");
}
- (void)testSettingTeacherNum_WithWrongFormat_upBorder
{
    BOOL success = [CoreCalculate setTeacherNum:10 andNum2:2 andNum3:9];
    XCTAssertFalse(success, @"should not success when teacher number>9");
}
- (void)testSettingTeacherNum_WithWrongFormat_equalNum13
{
    BOOL success = [CoreCalculate setTeacherNum:8 andNum2:3 andNum3:8];
    XCTAssertFalse(success, @"should not success when teachers numbers are equal");
}
- (void)testSettingTeacherNum_WithWrongFormat_equalNum12
{
    BOOL success = [CoreCalculate setTeacherNum:3 andNum2:3 andNum3:8];
    XCTAssertFalse(success, @"should not success when teachers numbers are equal");
}
- (void)testSettingTeacherNum_WithWrongFormat_equalNum123
{
    BOOL success = [CoreCalculate setTeacherNum:3 andNum2:3 andNum3:3];
    XCTAssertFalse(success, @"should not success when teachers numbers are equal");
}


- (void)testSettingTeacherNum_WithRightFormat
{
    BOOL success = [CoreCalculate setTeacherNum:3 andNum2:5 andNum3:7];
    XCTAssertTrue(success, @"should success when teachers numbers set with right format");
}
- (void)testGetCount_WithWrongIndex
{
    [CoreCalculate setTeacherNum:3 andNum2:5 andNum3:7];
    XCTAssertThrowsSpecificNamed([CoreCalculate getCountResult:0], NSException, @"StackOverflowException", @"should throw exception");
}
- (void)testGetCount_WithRightIndex
{
    [CoreCalculate setTeacherNum:3 andNum2:5 andNum3:7];
    NSString *studentCount = [CoreCalculate getCountResult:1];
    XCTAssertNotNil(studentCount, @"should retrun the count");
}
@end
