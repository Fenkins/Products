//
//  ProductsListTableViewController.m
//  Products
//
//  Created by Fenkins on 23/06/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "ProductsListTableViewController.h"

#import "Products.h"
#import "ProductsParser.h"

@interface ProductsListTableViewController ()

@property (strong,nonatomic)NSMutableArray *productArray;


@end

@implementation ProductsListTableViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Products", @"List of products availible");
        self.tabBarItem.image = [UIImage imageNamed:@"products_bar_pic.png"];
        if (self.tabBarItem.image == nil) {
            NSLog(@"tabBarItem is nil");
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.productArray = [[NSMutableArray alloc] init];
    ProductsParser *menuParser = [[ProductsParser alloc] initWithArray:self.productArray];
    [menuParser parseXMLFile];
    // The parser is done, we can release it immediately
    [menuParser release];
    NSLog(@"Count %ul", self.productArray.count);
    Products *firstProduct = self.productArray[0];
    Products *secondProduct = self.productArray[1];
    NSLog(@"%@", firstProduct.productName);
    NSLog(@"%@", secondProduct.productName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
//    return self.productArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    if (cell != nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
    // Configure the cell...
//    Products *product = self.productArray[indexPath.row];
//    NSLog(@"Look: %@",product.productName);
//    cell.textLabel.text = product.productName;
//    int i = 0;
//    for (i = 0; i == self.productArray.count ; i++) {
//        cell.textLabel.text = self.productArray[i];
//        
//    
//        NSLog(@"Look: %@",self.productArray[0]);
//        NSLog(@"Look: %@",self.productArray[1]);

  //  }
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
