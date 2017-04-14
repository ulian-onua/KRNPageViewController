//
//  ViewController.m
//  KRNPageViewControllerExample
//
//  Created by ulian_onua on 1/28/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import "ViewController.h"
#import "KRNPageViewController.h"
#import "ODSPageContentViewController.h"


@interface ViewController () <KRNPageViewControllerDelegate>
@property (strong, nonatomic) NSArray <NSString*> *textArray, *buttonTitlesArray, *imageNamesArray;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIView *embeddedView;
@property (strong, nonatomic) KRNPageViewController *pageViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _textArray = @[@"You will knew new information about Odessa", @"You will explore dictionary of unique Odessa's words", @"You will see beautiful Odessa sights"];

    _imageNamesArray = @[@"panoramaOdessa_01", @"panoramaOdessa_02", @"panoramaOdessa_03"];
    
    self.pageViewController = [KRNPageViewController createdAsEmbeddedToView:self.embeddedView ofViewController:self];
    
    self.pageViewController.pagesCount = _textArray.count;
    self.pageViewController.initialIndex = 1;
    // self.pageViewController.embeddedPageControl = YES;  //uncomment if you want to enable embeddedPageControl
    self.pageViewController.controllerDelegate = self;
    
    [self.pageControl setCurrentPage:_pageViewController.initialIndex];
}

#pragma mark - KRNPageViewControllerDelegate
    
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    ODSPageContentViewController *unitVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([ODSPageContentViewController class])];
    __weak typeof(self) weakSelf = self;
    __weak typeof(unitVC) weakUnitVC = unitVC;
    unitVC.initialBlock =^ {
        weakUnitVC.panoramaImageView.image = [UIImage imageNamed:weakSelf.imageNamesArray[index]];
        weakUnitVC.welcomeLabel.text = weakSelf.textArray[index];
    };
    return unitVC;
}

- (void)viewControllerWithIndexPresented:(NSInteger)index {
    [self.pageControl setCurrentPage:index];
}

@end
