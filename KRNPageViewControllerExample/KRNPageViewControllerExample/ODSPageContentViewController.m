//
//  ODSPageContentViewController.m
//  testDictionary
//
//  Created by Drapaylo Yulian on 19.04.16.
//  Copyright © 2016 Drapaylo Yulian. All rights reserved.
//

#import "ODSPageContentViewController.h"

@interface ODSPageContentViewController ()

@end

@implementation ODSPageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.initialBlock) {
        self.initialBlock();
    }
}

@end
