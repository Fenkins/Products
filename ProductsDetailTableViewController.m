//
//  ProductsDetailTableViewController.m
//  Products
//
//  Created by Fenkins on 07/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "ProductsDetailTableViewController.h"

@interface ProductsDetailTableViewController ()

@end

@implementation ProductsDetailTableViewController
@synthesize passedProduct;

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:true];
    [self.view removeFromSuperview];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CGRect screenRect = [[UIScreen mainScreen]bounds];
        return screenRect.size.width-screenRect.size.width/9;
    } else {
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    if (cell != nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    }
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageWithContentsOfFile:passedProduct.productImage];
            break;
        case 1:
            cell.textLabel.text = passedProduct.productName;
            break;
        case 2:
            cell.textLabel.text = passedProduct.productDescription;
            
            [cell.textLabel setAdjustsFontSizeToFitWidth:true];
            [cell.textLabel setMinimumScaleFactor:0.8];
            if (cell.textLabel.minimumScaleFactor <= 0.9) {
                [cell.textLabel setNumberOfLines:2];
            }
            break;
        default:
            cell.textLabel.text = @"Something goes wrong";
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

-(void) dealloc {
    [passedProduct release];
    [self.tableView release];
    [super dealloc];
}

@end
