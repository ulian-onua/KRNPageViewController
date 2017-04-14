KRNPageViewController
===============

KRNPageViewController is a wrapper above UIPageViewController that simplifies its usage.

## About

Many aplications have so called Welcome Screens. Welcome Screen is a slider that is shown after first application launch or before user authorization/registration. The most popular solution of implementation of Welcome Screen is usage of UIPageViewController. Work with UIPageViewController from scratch requires performing typical, repeating operations of implementing methods of UIPageViewControllerDelegate and UIPageViewControllerDataSource.

KRNPageViewController is written to simplify creation and setting up of Welcome Screens in iOS, hiding work with default protocols under the hood.

## Installation
####CocoaPods

Just add `pod 'KRNPageViewController'` to your Podfile and run `pod install` in Terminal from your project folder.

Write `#import "KRNPageViewController.h"` in files where you need to use KRNPageViewController. 


## How to use
1.**Create a property of KRNPageViewController** and allocate its instance using next method:

```objc
@property (strong, nonatomic) KRNPageViewController *pageViewController;
...
_pageViewController = 
[KRNPageViewController createdAsEmbeddedToView:self.embeddedView 
ofViewController:self];
```
where embeddedView is a view in subview's hieararchy of main view of ViewController to which KRNPageViewController should be added.

2.Than you must to **configure instance KRNPageViewController using its properties**:

```objc
pageViewController.pagesCount = 3; // number of pages
pageViewController.initialIndex = 0; //initial page index from which presentation of KRNPageViewController will start
pageViewController.embeddedPageControl = YES; // optional - use embedded page controller (NO - by default)
```

3.**Implement KRNPageViewControllerDelegate protocol and assign instance that implements mentioned protocol to controllerDelegate property** of KRNPageViewController.

```objc
pageViewController.controllerDelegate = self; //self must conform to KRNPageViewControllerDelegate protocol
```
KRNPageViewControllerDelegate has two methods:

```objc
@required
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index;  //implement this method to return appropriate view controller for index.
@optional
- (void)viewControllerWithIndexPresented:(NSInteger)index; //implement this method to handle event of presenting viewControllerWithIndex
```

**viewControllerAtIndex:** is a required method that plays role of data source for KRNPageViewController and returns UIViewController for appropriate index of KRNPageViewController.
Range of indexes depends on value of property pagesCount of KRNPageViewControllerInstance and equals to 0..<pagesCount. So if you have three screens for Welcome Screen you should set pagesCount property to 3 so range of indexes of appropriate view controllers will be 0, 1 and 2.

**viewControllerWithIndexPresented:** is called after next view controller of KRNPageViewController was presented. Useful to handle this event and set up of UIPageControl instance if it is was implemented.

**For more details see KRNPageViewControllerExample project.**

## Requirements

* iOS 8.0 and above
* XCode 6+

## License

KRNPageViewController is released under the MIT license. See LICENSE for details.

## Contact

Any suggestion or question? Please create a Github issue or reach me out.

[LinkedIn](https://www.linkedin.com/in/julian-drapaylo)
