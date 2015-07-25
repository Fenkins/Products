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
    _productScrollImageView.image = [UIImage imageWithContentsOfFile:passedProduct.productImage];
    _textLabel.text = passedProduct.productDescription;
    _textLabel.lineBreakMode = 0;
    _textLabel.numberOfLines = 0;
    [_textLabel sizeToFit];
}

- (void)dealloc {
    [passedProduct release];
    [_textLabel release];
    [_productScrollImageView release];
    [super dealloc];
}
@end
