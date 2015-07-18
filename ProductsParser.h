//
//  ProductsParser.h
//  Products
//
//  Created by Fenkins on 03/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//
// Creating methods and custom initializers to populate productsArray with data

#import <Foundation/Foundation.h>

@interface ProductsParser : NSObject <NSXMLParserDelegate>

@property (nonatomic,retain) NSMutableArray *productArray;

-(id) initWithArray:(NSMutableArray *) productArray;
-(void) parseXMLFile;

-(void) dealloc;

@end
