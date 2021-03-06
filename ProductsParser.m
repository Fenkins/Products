
//
//  ProductsParser.m
//  Products
//
//  Created by Fenkins on 03/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "ProductsParser.h"
#import "Products.h"

@interface ProductsParser()
@property NSXMLParser *parser;
@property NSString *element;

@property NSMutableString *currentProductName;
@property NSMutableString *currentProductDescription;
@property NSMutableString *currentProductImage;

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
    self.parser = [[[NSXMLParser alloc]initWithContentsOfURL:xmlPath]autorelease];
    self.parser.delegate = self;
    [self.parser parse];
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    self.element = elementName;
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"  " withString:@""];
    
    if ([self.element isEqualToString:@"Name"]) {
        if (self.currentProductName == nil) {
            self.currentProductName = [[[NSMutableString alloc] initWithString:string]autorelease];
        } else {
            [self.currentProductName appendString:string];
        }
    }
    if ([self.element isEqualToString:@"Description"]) {
        if (self.currentProductDescription == nil) {
            self.currentProductDescription = [[[NSMutableString alloc] initWithString:string]autorelease];
        } else {
            [self.currentProductDescription appendString:string];
        }
    }    if ([self.element isEqualToString:@"Image"]) {
        if (self.currentProductImage == nil) {
            NSString *theImagePathString = [[NSBundle mainBundle] pathForResource:string ofType:@""];
            NSMutableString *theImagePathMutableString = [theImagePathString mutableCopy];
            self.currentProductImage = [[[NSMutableString alloc] initWithString:theImagePathMutableString]autorelease];
            [theImagePathMutableString release];
        } else {
            [self.currentProductImage appendString:string];
        }
    }
}

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"Product"]) {
        Products *thisProduct = [[Products alloc] initWithName:self.currentProductName description:self.currentProductDescription image:self.currentProductImage];
        
        [self.productArray addObject:thisProduct];

        self.currentProductName = nil;
        self.currentProductDescription = nil;
        self.currentProductImage = nil;
        
        [thisProduct release];
        thisProduct = nil;
        
        self.element = nil;
    }
}

-(void) dealloc {
    [super dealloc];
}

@end
