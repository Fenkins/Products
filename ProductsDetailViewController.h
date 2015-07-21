//
//  ProductsDetailViewController.h
//  Products
//
//  Created by Fenkins on 19/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Products.h"

@interface ProductsDetailViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *productScrollImageView;
@property (retain, nonatomic) IBOutlet UILabel *textLabel;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

@property (retain, nonatomic) Products *passedProduct;

@end
