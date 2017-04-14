//
//  ODSPageContentViewController.h
//  testDictionary
//
//  Created by Drapaylo Yulian on 19.04.16.
//  Copyright © 2016 Drapaylo Yulian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KRNPageUnitViewController.h"

@interface ODSPageContentViewController : UIViewController<KRNPageUnitViewController>

@property (weak, nonatomic) IBOutlet UIImageView *panoramaImageView; // изображение панорамы
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel; // приветственное сообщение
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl; // пейдж контрол
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;  // кнопка отмены (Пропустить/Готово)

@property (assign, nonatomic) NSInteger pageIndex;

@property (strong, nonatomic) void(^initialBlock)(void);
@end
