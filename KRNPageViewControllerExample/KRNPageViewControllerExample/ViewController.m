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


@interface ViewController () <KRNPageViewControllerDelegate> {
    //NSArray <NSString*> *_imageNamesArray, *_titlesArray, *_textsArray;
 //   NSArray <NSString*> *_textArray, *_buttonTitlesArray, *_imageNamesArray;
}
@property (strong, nonatomic) NSArray <NSString*> *textArray, *buttonTitlesArray, *imageNamesArray;


@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIView *embeddedView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _textArray = @[@"You will knew new information about Odessa", @"You will explore dictionary of unique Odessa's words", @"You will see beautiful Odessa sights"];

    _imageNamesArray = @[@"panoramaOdessa_01", @"panoramaOdessa_02", @"panoramaOdessa_03"];
    
    KRNPageViewController *pageViewController = [KRNPageViewController createdAsEmbeddedToView:self.embeddedView ofViewController:self];
    
    pageViewController.pagesCount = _textArray.count;
    pageViewController.initialIndex = 0;
    // pageViewController.embeddedPageControl = YES;
    pageViewController.controllerDelegate = self;

}

- (UIViewController<KRNPageUnitViewController> *)viewControllerAtIndex:(NSUInteger)index {
    ODSPageContentViewController *unitVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([ODSPageContentViewController class])];
    
    __weak typeof(self) weakSelf = self;
    __weak typeof(unitVC) weakUnitVC = unitVC;
    unitVC.initialBlock =^ {
        weakUnitVC.panoramaImageView.image = [UIImage imageNamed:weakSelf.imageNamesArray[index]];
        weakUnitVC.welcomeLabel.text = weakSelf.textArray[index];
    };
    

    unitVC.pageIndex = index;
    
    return unitVC;
}


- (void)viewControllerWithIndexPresented:(NSInteger)index {
    [_pageControl setCurrentPage:index];
}

@end
