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
// Product properties below, temporaty stuff
@property NSString *currentProductName;
@property NSString *currentProductDescription;
@property NSString *currentProductImage;

@end

@implementation ProductsParser

-(id) initWithArray:(NSMutableArray *)productArray {
    self = [super init];
    if (self) {
        self.productsArray = productArray;
    }
    return self;
}

-(void) parseXMLFile {
    NSURL *xmlPath = [[NSBundle mainBundle] URLForResource:@"productsList" withExtension:@"xml"];
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlPath];
    
    // Dont forget to add <NSXMLParserDelegate> protocol in the .h file to get rid of the warning
    self.parser.delegate = self;
    // Parser is go
    [self.parser parse];
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    self.element = elementName;
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string {
    if ([self.element isEqualToString:@"Name"]) {
        // string is a returned string that is just being analized
        self.currentProductName = string;
        //NSLog(@"String: %@", string);
    }
    if ([self.element isEqualToString:@"Description"]) {
        self.currentProductDescription = string;
        //NSLog(@"String: %@", string);
    }
    if ([self.element isEqualToString:@"Image"]) {
        self.currentProductImage = string;
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    // This will add found elements to the array and reset the element when we see the next "Product"
    if ([elementName isEqualToString:@"Product"]) {
        Products *thisProduct = [[Products alloc]initWithName:self.currentProductName description:self.currentProductDescription image:self.currentProductImage];
        if (thisProduct == nil) {
            NSLog(@"всё очень плохо, шэф");
        }
        [self.productsArray addObject:thisProduct];
        
        if (self.productsArray == nil) {
            NSLog(@"всё пропало, шэф");
        }
    }
    // resetting the element so it is ready to take up a new one
    self.element = nil;
    NSLog(@"Array count %ul",self.productsArray.count);
    //NSLog(@"elementName %@", elementName);
}

@end