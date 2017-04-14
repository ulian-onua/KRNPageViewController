//
//  ADMWelcomePageUnitViewController.h
//  Connectoo
//
//  Created by ulian_onua on 1/27/17.
//  Copyright © 2017 Abracadabra Robotics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADMWelcomePageUnitViewController : UIViewController
@property (strong, nonatomic) NSString *welcomeImageName;
@property (strong, nonatomic) NSString *welcomeTitleText;
@property (strong, nonatomic) NSString *welcomeBodyText;
@property (assign, nonatomic) NSInteger pageIndex;
@end
