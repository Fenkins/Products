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
        self.title = NSLocalizedString(@"About us", @"Information about our company");
        self.tabBarItem.image = [UIImage imageNamed:@"about_us_bar_pic.png"];
        if (self.tabBarItem.image == nil) {
            NSLog(@"tabBarItem image is nil");
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect screenRect = [[UIScreen mainScreen]bounds];
    
    UILabel *aboutUsShort = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, screenRect.size.width*9/10, screenRect.size.height*3/8)];
    aboutUsShort.center = CGPointMake(screenRect.size.width/2, screenRect.size.height*3/10);
    aboutUsShort.text = NSLocalizedString(@"We are working with all kinds of boxes. Big boxes, small boxes, wooden, cardboard, stainless steel, you name it. \n Feel free to press on More Info button if interested", "Company description");
    [aboutUsShort setTextAlignment:NSTextAlignmentCenter];
    [aboutUsShort setNumberOfLines:6];
    
    UIButton *detailedInfoButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, screenRect.size.width*3/4, screenRect.size.height/6)];
    detailedInfoButton.center = CGPointMake(screenRect.size.width/2, screenRect.size.height*4/6);
    detailedInfoButton.backgroundColor = [UIColor lightGrayColor];
    detailedInfoButton.layer.cornerRadius = 20;
    [detailedInfoButton setTitle:@"More Info" forState:UIControlStateNormal];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
