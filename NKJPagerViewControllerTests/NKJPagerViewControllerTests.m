//
//  NKJPagerViewControllerTests.m
//  NKJPagerViewControllerTests
//
//  Created by nakajijapan on 12/2/14.
//  Copyright (c) 2015 net.nakajijapan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NKJPagerViewController.h"
#import "ViewController.h"

@interface NKJPagerViewControllerTests : XCTestCase <NKJPagerViewDataSource>
@property NKJPagerViewController *pagerViewController;
@end

@implementation NKJPagerViewControllerTests

- (void)setUp {
    [super setUp];
    self.pagerViewController = [[NKJPagerViewController alloc] initWithNibName:nil bundle:nil];
    self.pagerViewController.dataSource = self;
    [UIApplication.sharedApplication.delegate.window setRootViewController:self.pagerViewController];
    [self.pagerViewController viewDidLoad];
}

- (void)tearDown {
    [super tearDown];
    self.pagerViewController = nil;
}

- (void)testTabsNotNil {
    XCTAssertTrue(self.pagerViewController.tabs != nil , "");
}

- (void)testTabsCount {
    XCTAssertTrue(self.pagerViewController.tabs.count == 10 , "Count of tabs is correct.");
}

- (void)testTabsViewOfSubViewsCount {
    [self.pagerViewController viewDidLoad];
    XCTAssertTrue(self.pagerViewController.tabsView.subviews.count == 10 , "Count of subviews is correct.");
}

- (void)testTabViewOfWidth {
    UIView *view = (UIView *)self.pagerViewController.tabs[0];
    XCTAssertTrue(view != nil);
    XCTAssertTrue(view.frame.size.width == 125.f);
}

#pragma mark - NKJPagerViewDataSource

- (NSUInteger)numberOfTabView
{
    return 10;
}

- (CGFloat)widthOfTabViewWithIndex:(NSInteger)index
{
    return 125.f;
}

- (UIView *)viewPager:(NKJPagerViewController *)viewPager viewForTabAtIndex:(NSUInteger)index
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, [[UIScreen mainScreen] bounds].size.width / 3.f, 44.f)];
    return label;
}

- (UIViewController *)viewPager:(NKJPagerViewController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index
{
    UIViewController *viewController = [[UIViewController alloc] init];
    return viewController;
}

@end
