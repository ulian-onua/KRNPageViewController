//
//  KRNPageViewController.m
//  Connectoo
//
//  Created by ulian_onua on 1/27/17.
//
//

#import "KRNPageViewController.h"


@implementation KRNPageViewController


+ (id)createdAsEmbeddedToView:(UIView *)view ofViewController:(UIViewController *)viewController {
    if (!view || !viewController) {
        return nil;
    }
    KRNPageViewController *pageViewController = [[KRNPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    [viewController addChildViewController:pageViewController];
    //set up constraints
    pageViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:pageViewController.view];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:pageViewController.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:pageViewController.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:pageViewController.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:pageViewController.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [pageViewController didMoveToParentViewController:viewController];
    return pageViewController;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIViewController *startingViewController = [_controllerDelegate viewControllerAtIndex:_initialIndex];
    [self setViewControllers:@[startingViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)setCurrentUnitPageViewControllerWithIndex:(NSInteger)index {
    NSInteger currentIndex = [self indexOfCurrentUnitViewController];
    UIPageViewControllerNavigationDirection navigationDirection;
    
    if (index == currentIndex) {
        return;
    } else if (index > currentIndex) {
        navigationDirection = UIPageViewControllerNavigationDirectionForward;
    } else {
        navigationDirection = UIPageViewControllerNavigationDirectionReverse;
    }

    UIViewController *unitViewController = [_controllerDelegate viewControllerAtIndex:index];
    [self setViewControllers:@[unitViewController] direction:navigationDirection animated:YES completion:nil];
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (![viewController respondsToSelector:@selector(pageIndex)]) {
        return nil;
    }
    NSUInteger index = ((id<KRNPageUnitViewController>) viewController).pageIndex;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [_controllerDelegate viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (![viewController respondsToSelector:@selector(pageIndex)]) {
        return nil;
    }
    
    NSUInteger index = ((id<KRNPageUnitViewController>) viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == _pagesCount) {
        return nil;
    }
    return [_controllerDelegate viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return _embeddedPageControl ? _pagesCount : 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return _embeddedPageControl ? _initialIndex : 0;
}

#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if ([_controllerDelegate respondsToSelector:@selector(viewControllerWithIndexPresented:)]) {
        [_controllerDelegate viewControllerWithIndexPresented:[self indexOfCurrentUnitViewController]];
    }
}

#pragma mark - Helpers

- (NSInteger)indexOfCurrentUnitViewController {
    id<KRNPageUnitViewController> unitController = self.viewControllers.firstObject;
    return unitController.pageIndex;
}

@end

@interface UIViewController (KRNUnitPageViewControllerIndex)
@property (assign, nonatomic) NSInteger krnPageIndex;
@end
