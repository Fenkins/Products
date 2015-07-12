//
//  AboutDetailViewController.m
//  Products
//
//  Created by Fenkins on 11/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "AboutDetailViewController.h"

@interface AboutDetailViewController ()

@end

@implementation AboutDetailViewController

-(void) backButtonPressed {
    [self.parentViewController dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(backButtonPressed)];

    self.navigationItem.leftBarButtonItem = backButton;
    [backButton release];
    
    CGRect screenRect = [[UIScreen mainScreen]bounds];
    UILabel *detailedInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, screenRect.size.width*8/10, screenRect.size.height*8/10)];
    detailedInfoLabel.center = CGPointMake(screenRect.size.width/2, screenRect.size.height/2+screenRect.size.height/16);
    detailedInfoLabel.text = NSLocalizedString(@"We supply all kind of boxes, you name it - we got it. \n\n Call us on 1-800-MYBOX \n\n Or visit our website: \n http://profBoxSuppliers.com \n\n You could also visit our office at 30 E University Ave, Gainesville, FL 32601, United States", @"detailed info text");
    [detailedInfoLabel setTextAlignment:NSTextAlignmentCenter];
    [detailedInfoLabel setNumberOfLines:20];
    [self.view addSubview:detailedInfoLabel];
    
    UIImage *aboutUsBoxImg = [UIImage imageNamed:@"about_us_detail_Box.png"];
    UIImageView *aboutUsBoxImgView = [[UIImageView alloc] initWithImage:aboutUsBoxImg];
    aboutUsBoxImgView.frame = CGRectMake(0.0, 0.0, screenRect.size.width/5, screenRect.size.width/5);
    aboutUsBoxImgView.center = CGPointMake(screenRect.size.width*4/10, screenRect.size.height/10);
    [detailedInfoLabel addSubview:aboutUsBoxImgView];
    [aboutUsBoxImgView release];
    [detailedInfoLabel release];
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
