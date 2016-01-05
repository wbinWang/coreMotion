//
//  coreMotionDemo1UITests.m
//  coreMotionDemo1UITests
//
//  Created by yeeda on 16/1/4.
//  Copyright © 2016年 WB. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface coreMotionDemo1UITests : XCTestCase

@end

@implementation coreMotionDemo1UITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *nextButton = app.buttons[@"next"];
    
    XCUIElement *element = [[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"secondView"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    
    XCUIElement *motion1Button = app.navigationBars[@"secondView"].buttons[@"motion1"];
    
    XCUIElement *element2 = [[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"motion1"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    [[element2 childrenMatchingType:XCUIElementTypeOther].element tap];
    [element2 tap];
    [element2 tap];
    [element2 tap];
    [nextButton tap];
    [motion1Button tap];
    [nextButton tap];
    
    [motion1Button tap];
    [nextButton tap];
    [motion1Button tap];
    [nextButton tap];
    [motion1Button tap];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
