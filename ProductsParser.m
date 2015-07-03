//
//  ProductsParser.m
//  Products
//
//  Created by Fenkins on 03/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "ProductsParser.h"

// This will create private properties
@interface ProductsParser()
@property NSXMLParser *parser;
@property NSString *element;

@property NSString *currentProductName;
@property NSString *currentProductDescription;

@end



@implementation ProductsParser

-(id) initWithArray:(NSMutableArray *)productArray {
    self = [super init];
    if (self) {
        self.productArray = productArray;
    }
    return self;
}

-(void) parseXMLFile {
    NSURL *xmlPath = [[NSBundle mainBundle]URLForResource:@"productsList" withExtension:@"xml" ];
    self.parser = [[NSXMLParser alloc]initWithContentsOfURL:xmlPath];
    self.parser.delegate = self;
    [self.parser parse];
}

@end
