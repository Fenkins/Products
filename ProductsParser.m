//
//  ProductsParser.m
//  Products
//
//  Created by Fenkins on 03/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "ProductsParser.h"
#import "Products.h"

// This will create private properties
@interface ProductsParser()
@property NSXMLParser *parser;
@property NSString *element;

@property NSString *currentProductName;
@property NSString *currentProductDescription;
@property NSString *currentProductImage;

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
    // We will do it here instead of writing that in viewDidLoad
    NSURL *xmlPath = [[NSBundle mainBundle]URLForResource:@"productsList" withExtension:@"xml" ];
    self.parser = [[NSXMLParser alloc]initWithContentsOfURL:xmlPath];
    self.parser.delegate = self;
    [self.parser parse];
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    self.element = elementName;
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([self.element isEqualToString:@"Name"]) {
        self.currentProductName = string;
    }
    if ([self.element isEqualToString:@"Description"]) {
        self.currentProductDescription = string;
    }
    if ([self.element isEqualToString:@"Image"]) {
        self.currentProductImage = string;
    }
}

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"Product"]) {
        Products *thisProduct = [[Products alloc] initWithName:self.currentProductName description:self.currentProductDescription image:self.currentProductImage];
        if (thisProduct == nil) {
            NSLog(@"thisProduct is equal to nil. Find out why.");
        } else {
            [self.productArray addObject:thisProduct];
        }
        if (self.productArray == nil) {
            NSLog(@"It is most likely you forgot to alloc-init productArray");
        }
        self.element = nil;
    }
}

@end
