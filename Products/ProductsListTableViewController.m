//
//  ProductsListTableViewController.m
//  Products
//
//  Created by Fenkins on 23/06/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "ProductsListTableViewController.h"

@interface ProductsListTableViewController ()

@property (strong,nonatomic)NSMutableArray *productArray;


@end

@implementation ProductsListTableViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Продукты", @"Список доступных продуктов");
        self.tabBarItem.image = [UIImage imageNamed:@"products_bar_pic.png"];
        if (self.tabBarItem.image == nil) {
            NSLog(@"tabBarItem image is nil");
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.productArray = [[[NSMutableArray alloc] init]autorelease];
    ProductsParser *menuParser = [[ProductsParser alloc] initWithArray:self.productArray];
    [menuParser parseXMLFile];
    [menuParser release];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:true];
    [self.view removeFromSuperview];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.productArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]autorelease];
    if (cell != nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]autorelease];
    }
    Products *product = self.productArray[indexPath.row];
    cell.textLabel.text = product.productName;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];

    ProductsDetailViewController *productDetVC = [[ProductsDetailViewController alloc] initWithNibName:@"ProductsDetailViewController" bundle:nil];
    Products *productSelected = self.productArray[indexPath.row];
    productDetVC.passedProduct = productSelected;
    [self.navigationController pushViewController:productDetVC animated:true];
    
    [productDetVC release];
}

-(void) dealloc {
    [self.productArray release];
    [super dealloc];
}

@end
