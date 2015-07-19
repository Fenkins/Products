//
//  ProductsDetailViewController.m
//  Products
//
//  Created by Fenkins on 19/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "ProductsDetailViewController.h"

@implementation ProductsDetailViewController
@synthesize passedProduct;

- (void)viewDidLoad {
    [super viewDidLoad];
    _productImageView.image = [UIImage imageWithContentsOfFile:passedProduct.productImage];
    _textLabel.text = passedProduct.productDescription;
    _textLabel.lineBreakMode = 0;
    _textLabel.numberOfLines = 0;
    [_textLabel sizeToFit];
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

- (void)dealloc {
    [_textLabel release];
    [_productImageView release];
    [_productImageView release];
    [super dealloc];
}
@end
