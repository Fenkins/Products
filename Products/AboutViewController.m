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
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect screenRect = [[UIScreen mainScreen]bounds];
    UILabel *aboutUsShort = [[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width/2, screenRect.size.height*1/4, screenRect.size.width*3/4, screenRect.size.height/6)];
    aboutUsShort.backgroundColor = [UIColor redColor];
    
    UIButton *detailedInfoButton = [[UIButton alloc] initWithFrame:CGRectMake(screenRect.size.width/2, screenRect.size.height*3/4, screenRect.size.width*3/4, screenRect.size.height/6)];
    detailedInfoButton.backgroundColor = [UIColor blueColor];
    detailedInfoButton.layer.cornerRadius = 20;
    
    [self.view addSubview:aboutUsShort];
    [self.view addSubview:detailedInfoButton];
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
