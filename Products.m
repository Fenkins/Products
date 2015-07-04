//
//  Products.m
//  Products
//
//  Created by Fenkins on 03/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "Products.h"

@implementation Products

-(id) initWithName:(NSString *)name description:(NSString *)description image:(NSString *)image {
    self = [super init];
    
    if (self) {
        self.productName = name;
        self.productDescription = description;
        self.productImage = image;
    }
    return self;
}


@end
