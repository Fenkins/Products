//
//  AboutViewController.m
//  Products
//
//  Created by Fenkins on 23/06/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"О компании", @"Информация о нашей компании");
        self.tabBarItem.image = [UIImage imageNamed:@"about_us_bar_pic.png"];
        if (self.tabBarItem.image == nil) {
            NSLog(@"tabBarItem image is nil");
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect screenRect = [[UIScreen mainScreen]bounds];
    
    UILabel *aboutUsShort = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, screenRect.size.width*9/10, screenRect.size.height*3/8)];
    aboutUsShort.center = CGPointMake(screenRect.size.width/2, screenRect.size.height*3/10);
    aboutUsShort.text = NSLocalizedString(@"Мы работаем со всеми типами коробок. Большие коробки, маленькие коробки, деревянные, картонные, стальные, любые. \n Если вам нужны наши коробки, нажмите на кнопку Показать информацию", "Описание компании");
    [aboutUsShort setTextAlignment:NSTextAlignmentCenter];
    [aboutUsShort setNumberOfLines:8];
    
    UIButton *detailedInfoButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, screenRect.size.width*3/4, screenRect.size.height/6)];
    detailedInfoButton.center = CGPointMake(screenRect.size.width/2, screenRect.size.height*4/6);
    detailedInfoButton.backgroundColor = [UIColor lightGrayColor];
    detailedInfoButton.layer.cornerRadius = 20;
    [detailedInfoButton setTitle:NSLocalizedString(@"Показать информацию", @"кнопка, ведущая на страницу с полным описанием") forState:UIControlStateNormal];
    [detailedInfoButton addTarget:self action:@selector(presentVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:aboutUsShort];
    [aboutUsShort release];
    [self.view addSubview:detailedInfoButton];
}

- (void) presentVC {
    AboutDetailViewController *aboutDetailedView = [[AboutDetailViewController alloc] init];
    UINavigationController *modalViewNavController =
    [[UINavigationController alloc] initWithRootViewController:aboutDetailedView];
    [aboutDetailedView release];
    [modalViewNavController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];

    [self presentViewController:modalViewNavController animated:true completion:nil];
    [modalViewNavController release];
}

@end
