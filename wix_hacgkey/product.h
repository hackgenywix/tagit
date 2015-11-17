//
//  product.h
//  project
//
//  Created by DANIEL on 11/13/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "ebayProduct.h"
#import "user.h"
@interface product : NSObject
@property (strong,nonatomic)NSData* imageData;
@property (copy,nonatomic)NSString* title;
@property (copy,nonatomic)NSString* descripitonText;
@property (assign,nonatomic)double startPrice;
@property (assign,nonatomic)double endPrice;
@property (strong,nonatomic)NSMutableArray* userAskedProduct;
@property (strong,nonatomic)PFObject* objectRepr;
@property (strong,nonatomic)ebayProduct* productInEbay;
@property (strong,nonatomic)user* userFoundProduct;
@property (assign,nonatomic)BOOL iAskedProduct;
- (instancetype)initWithPFObject:(PFObject*)object;
@end
