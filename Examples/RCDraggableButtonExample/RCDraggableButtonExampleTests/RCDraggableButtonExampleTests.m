//
//  RCDraggableButtonExampleTests.m
//  RCDraggableButtonExampleTests
//
//  Created by Looping on 14-2-8.
//  Copyright (c) 2014年 RidgeCorn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RCDraggableButton.h"

@interface RCDraggableButtonExampleTests : XCTestCase

@end

@implementation RCDraggableButtonExampleTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark common
- (void)testVersion {
    XCTAssertEqualObjects(RCDRAGGABLEBUTTON_VERSION, [RCDraggableButton version]);
}

#pragma mark init
- (void)testInitInKeyWindow {
    RCDraggableButton *draggableButton = [[RCDraggableButton alloc] initInView:nil WithFrame:CGRectMake(120, 120, 60, 60)];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton superclass]);
    XCTAssertEqualObjects(NULL, [draggableButton superview]);
}

- (void)testInitInView {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    [customView setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:1]];
    
    RCDraggableButton *draggableButton = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton superclass]);
    XCTAssertEqualObjects(customView, [draggableButton superview]);
}

#pragma mark remove
- (void)testRemoveFromView {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    [customView setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:1]];
    
    RCDraggableButton *draggableButton = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton superclass]);
    XCTAssertEqualObjects(customView, [draggableButton superview]);

    [RCDraggableButton removeAllFromView:customView];
    
    XCTAssertEqualObjects(NULL, [draggableButton superview]);
}

- (void)testRemoveFromViewWithTag {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    [customView setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:1]];
    
    RCDraggableButton *draggableButton = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    [draggableButton setTag:89];
    
    RCDraggableButton *tmpDraggableButton = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];

    XCTAssertEqualObjects([UIButton class], [draggableButton superclass]);
    XCTAssertEqualObjects(customView, [draggableButton superview]);
    
    XCTAssertEqualObjects([UIButton class], [tmpDraggableButton superclass]);
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [RCDraggableButton removeFromView:customView withTag:89];
    
    XCTAssertEqualObjects(NULL, [draggableButton superview]);
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
}

- (void)testRemoveFromViewWithTags {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    [customView setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:1]];
    
    RCDraggableButton *draggableButton1 = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    [draggableButton1 setTag:89];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton1 superclass]);
    XCTAssertEqualObjects(customView, [draggableButton1 superview]);
    
    RCDraggableButton *draggableButton2 = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    [draggableButton2 setTag:90];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton2 superclass]);
    XCTAssertEqualObjects(customView, [draggableButton2 superview]);
    
    RCDraggableButton *tmpDraggableButton = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    
    XCTAssertEqualObjects([UIButton class], [tmpDraggableButton superclass]);
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [RCDraggableButton removeFromView:customView withTags:@[@(89), @(90)]];
    
    XCTAssertEqualObjects(NULL, [draggableButton1 superview]);
    
    XCTAssertEqualObjects(NULL, [draggableButton2 superview]);
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
}

- (void)testRemoveFromViewInsideRect {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    [customView setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:1]];
    
    RCDraggableButton *draggableButton1 = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    [draggableButton1 setTag:89];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton1 superclass]);
    XCTAssertEqualObjects(customView, [draggableButton1 superview]);
    
    RCDraggableButton *draggableButton2 = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    [draggableButton2 setTag:90];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton2 superclass]);
    XCTAssertEqualObjects(customView, [draggableButton2 superview]);
    
    RCDraggableButton *tmpDraggableButton = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(0, 0, 60, 60)];
    
    XCTAssertEqualObjects([UIButton class], [tmpDraggableButton superclass]);
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [RCDraggableButton removeAllFromView:customView insideRect:CGRectMake(100, 100, 100, 100)];

    XCTAssertEqualObjects(NULL, [draggableButton1 superview]);
    
    XCTAssertEqualObjects(NULL, [draggableButton2 superview]);
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [tmpDraggableButton removeFromSuperviewInsideRect:CGRectMake(10, 10, 80, 80)];
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);

    [tmpDraggableButton removeFromSuperviewInsideRect:CGRectMake(10, -10, 80, 80)];
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [tmpDraggableButton removeFromSuperviewInsideRect:CGRectMake(-10, 10, 80, 80)];
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [tmpDraggableButton removeFromSuperviewInsideRect:CGRectMake(-10, -10, 80, 80)];
    
    XCTAssertEqualObjects(NULL, [tmpDraggableButton superview]);
}

- (void)testRemoveFromViewOverlappedRect {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    [customView setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:1]];
    
    RCDraggableButton *draggableButton1 = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    [draggableButton1 setTag:89];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton1 superclass]);
    XCTAssertEqualObjects(customView, [draggableButton1 superview]);
    
    RCDraggableButton *draggableButton2 = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    [draggableButton2 setTag:90];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton2 superclass]);
    XCTAssertEqualObjects(customView, [draggableButton2 superview]);
    
    RCDraggableButton *tmpDraggableButton = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(0, 0, 60, 60)];
    
    XCTAssertEqualObjects([UIButton class], [tmpDraggableButton superclass]);
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [RCDraggableButton removeAllFromView:customView intersectsRect:CGRectMake(100, 100, 100, 100)];
    
    XCTAssertEqualObjects(NULL, [draggableButton1 superview]);
    
    XCTAssertEqualObjects(NULL, [draggableButton2 superview]);
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [tmpDraggableButton removeFromSuperviewIntersectsRect:CGRectMake(0, 100, 80, 80)];
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [tmpDraggableButton removeFromSuperviewIntersectsRect:CGRectMake(10, -10, 0, 0)];
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [tmpDraggableButton removeFromSuperviewIntersectsRect:CGRectMake(500, 10, 80, 80)];
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [tmpDraggableButton removeFromSuperviewIntersectsRect:CGRectMake(-10, -10, 80, 80)];
    
    XCTAssertEqualObjects(NULL, [tmpDraggableButton superview]);
}

- (void)testRemoveFromViewCrossedRect {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    [customView setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:1]];
    
    RCDraggableButton *draggableButton1 = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 500)];
    [draggableButton1 setTag:89];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton1 superclass]);
    XCTAssertEqualObjects(customView, [draggableButton1 superview]);
    
    RCDraggableButton *draggableButton2 = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(120, 120, 60, 60)];
    [draggableButton2 setTag:90];
    
    XCTAssertEqualObjects([UIButton class], [draggableButton2 superclass]);
    XCTAssertEqualObjects(customView, [draggableButton2 superview]);
    
    RCDraggableButton *tmpDraggableButton = [[RCDraggableButton alloc] initInView:customView WithFrame:CGRectMake(0, 0, 60, 60)];
    
    XCTAssertEqualObjects([UIButton class], [tmpDraggableButton superclass]);
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [RCDraggableButton removeAllFromView:customView crossedRect:CGRectMake(100, 100, 100, 100)];
    
    XCTAssertEqualObjects(NULL, [draggableButton1 superview]);
    
    XCTAssertEqualObjects(customView, [draggableButton2 superview]);
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [RCDraggableButton removeAllFromView:customView crossedRect:CGRectMake(100, 100, 100, 60)];
    
    XCTAssertEqualObjects(NULL, [draggableButton2 superview]);
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);

    [tmpDraggableButton removeFromSuperviewCrossedRect:CGRectMake(10, 10, 80, 80)];
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [tmpDraggableButton removeFromSuperviewCrossedRect:CGRectMake(10, -10, 80, 80)];
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [tmpDraggableButton removeFromSuperviewCrossedRect:CGRectMake(-10, 10, 80, 80)];
    
    XCTAssertEqualObjects(customView, [tmpDraggableButton superview]);
    
    [tmpDraggableButton removeFromSuperviewCrossedRect:CGRectMake(-10, -10, 80, 80)];
    
    XCTAssertEqualObjects(NULL, [tmpDraggableButton superview]);
}

@end
