//
//  ViewController.m
//  FragmentsTabsPager
//
//  Created by nakajijapan on 11/28/14.
//  Copyright (c) 2015 net.nakajijapan. All rights reserved.
//

#import "ViewController.h"
#import "ContentViewController.h"

@interface ViewController () <NKJPagerViewDataSource, NKJPagerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.navigationController.navigationBar.hidden = YES;
    self.dataSource = self;
    self.delegate = self;
    self.infiniteSwipe = NO;

    [super viewDidLoad];
}

#pragma mark - NKJPagerViewDataSource

- (NSUInteger)numberOfTabView
{
    return 10;
}

- (UIView *)viewPager:(NKJPagerViewController *)viewPager viewForTabAtIndex:(NSUInteger)index
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 60, 40.f)];

//    CGFloat r = (arc4random_uniform(255) + 1.f) / 255.0;
//    CGFloat g = (arc4random_uniform(255) + 1.f) / 255.0;
//    CGFloat b = (arc4random_uniform(255) + 1.f) / 255.0;
//    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
//    label.backgroundColor = color;
    

    label.font = [UIFont systemFontOfSize:12.0];
    label.text = [NSString stringWithFormat:@"Tab #%lu", index * 10];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];

    return label;
}

- (UIViewController *)viewPager:(NKJPagerViewController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
    vc.textLabel = [NSString stringWithFormat:@"Content View #%lu", index];
    return vc;
}

- (CGFloat)widthOfTabViewWithIndex:(NSInteger)index
{
    
        return 60;
    
}

#pragma mark - NKJPagerViewDelegate

- (void)viewPager:(NKJPagerViewController *)viewPager didSwitchAtIndex:(NSInteger)index withTabs:(NSArray *)tabs
{
    
    [UIView animateWithDuration:0.1f
        animations:^{
            for (UIView *view in self.tabs) {
                if (index == view.tag) {
                    view.alpha = 1.f;
                } else {
                    view.alpha = 0.5f;
                }
            }
        }
        completion:^(BOOL finished){}];
}

@end
