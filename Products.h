//
//  Products.h
//  Products
//
//  Created by Fenkins on 03/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Products : NSObject

@property (retain,nonatomic)NSString *productName;
@property (retain,nonatomic)NSString *productDescription;
@property (retain,nonatomic)NSString *productImage;

-(id) initWithName: (NSString *) name
       description: (NSString *) description
             image: (NSString *) image;


@end
