//
//  ADMWelcomePageUnitViewController.m
//  Connectoo
//
//  Created by ulian_onua on 1/27/17.
//  Copyright © 2017 Abracadabra Robotics. All rights reserved.
//

#import "ADMWelcomePageUnitViewController.h"

@interface ADMWelcomePageUnitViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageToTitleConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *welcomeImageView;
@property (weak, nonatomic) IBOutlet UILabel *welcomeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *welcomeTextLabel;
@end

@implementation ADMWelcomePageUnitViewController
- (void)viewDidLoad {
    [super viewDidLoad];    
    _welcomeImageView.image = [UIImage imageNamed:_welcomeImageName];
    _welcomeTitleLabel.text = _welcomeTitleText;
    _welcomeTextLabel.text = _welcomeBodyText;
}

@end
