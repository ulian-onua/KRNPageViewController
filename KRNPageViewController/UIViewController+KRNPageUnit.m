//
//  UIViewController+KRNPageUnit.m
//  KRNPageViewControllerExample
//
//  Created by ulian_onua on 4/14/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import "UIViewController+KRNPageUnit.h"
#import <objc/runtime.h> 

@implementation UIViewController (KRNPageUnit)
static char* kPageIndexKey = "kPageIndexKey";
    
@dynamic pageIndex;
    
- (void)setPageIndex:(NSNumber *)pageIndex{
    objc_setAssociatedObject(self, kPageIndexKey, pageIndex, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
    
- (NSNumber *)pageIndex {
    return objc_getAssociatedObject(self, kPageIndexKey);
}
    
@end
