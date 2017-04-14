//
//  ODSPageContentViewController.h
//  testDictionary
//
//  Created by Drapaylo Yulian on 19.04.16.
//  Copyright © 2016 Drapaylo Yulian. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "KRNPageUnitViewController.h"

@interface ODSPageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *panoramaImageView;
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (strong, nonatomic) void(^initialBlock)(void);
@end
