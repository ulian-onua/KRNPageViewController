//
//  KRNPageViewController.m
//  Connectoo
//
//  Created by ulian_onua on 1/27/17.
// 
//

#import <UIKit/UIKit.h>

@protocol KRNPageViewControllerDelegate;

@interface KRNPageViewController : UIPageViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

+ (id)createdAsEmbeddedToView:(UIView *)view ofViewController:(UIViewController *)viewController;

@property (weak, nonatomic) id<KRNPageViewControllerDelegate> controllerDelegate;
@property (assign, nonatomic) NSInteger initialIndex; // initial index of view controller
@property (assign, nonatomic) NSInteger pagesCount; //count of page view controller pages (unit view controllers)
@property (assign, nonatomic) BOOL embeddedPageControl;

- (void)setCurrentUnitPageViewControllerWithIndex:(NSInteger)index;

@end

@protocol KRNPageViewControllerDelegate<NSObject>
@required
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index;  //implement this method to return appropriate view controller for index.
@optional
- (void)viewControllerWithIndexPresented:(NSInteger)index; //implement this method to handle event of presenting unit view controller with index
@end


