//
//  Products.h
//  Products
//
//  Created by Fenkins on 03/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//
// Helper class with custom initializer
// This one will help us create an object with name, description and image of the product in ProductsParser

#import <Foundation/Foundation.h>

@interface Products : NSObject

@property (nonatomic,retain)NSString *productName;
@property (nonatomic,retain)NSString *productDescription;
@property (nonatomic,retain)NSString *productImage;

-(id) initWithName: (NSString *) name
       description: (NSString *) description
             image: (NSString *) image;


@end
