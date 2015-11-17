//
//  product.m
//  project
//
//  Created by DANIEL on 11/13/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import "product.h"
#import "ebayProduct.h"
#import "user.h"
#define TITLE_KEY @"title"
#define START_PRICE_KEY @""
#define END_PRICE_KEY @"endPrice"
#define USER_ASKED @"usersAskedBy"
#define USER_FOUND_KEY @"userFound"
#define IMAGE_KEY @"image"
#define DES_KEY @"description"
#define EBAY_PRODUCT_KEY @""
#define PRODUCT_CLASS_NAME @"products"
@implementation product
- (instancetype)initWithPFObject:(PFObject*)object
{
    self = [super init];
    if (self) {
        self.objectRepr = object;
        self.userAskedProduct = [NSMutableArray array];
        PFRelation* relation = [object relationForKey:USER_ASKED];
        for (PFObject* userAsked in [[relation query]findObjects]) {
            if([userAsked.objectId isEqualToString:[[PFUser currentUser]objectId]])
            {
                self.iAskedProduct = true;
            }
            [self.userAskedProduct addObject:[[user alloc]initWithPFObject:userAsked]];
        }
        
        PFFile* file = object[IMAGE_KEY];
        self.imageData = [file getData];
        self.descripitonText = object[DES_KEY];
        self.userFoundProduct = [[user alloc]initWithPFObject:object[USER_FOUND_KEY]];
        self.productInEbay = [[ebayProduct alloc]initWithPFObject:object[EBAY_PRODUCT_KEY]];
        self.startPrice = [object[START_PRICE_KEY]doubleValue];
        self.endPrice = [object[END_PRICE_KEY]doubleValue];
        self.title = object[TITLE_KEY];
    }
    return self;
}
-(void)saveWithComplition:(void (^) (NSError* error))complition
{
    if(!self.objectRepr)
    {
        self.objectRepr = [PFObject objectWithClassName:PRODUCT_CLASS_NAME];
    }
    self.objectRepr[DES_KEY] = self.descripitonText;
    
    if(self.userFoundProduct)
    {
        self.objectRepr[USER_FOUND_KEY]= self.userFoundProduct.user;
    }
    if(self.startPrice)
    {
        self.objectRepr[START_PRICE_KEY] = [NSNumber numberWithDouble:self.startPrice];
        
    }
    if(self.endPrice)
    {
        self.objectRepr[END_PRICE_KEY] = [NSNumber numberWithDouble:self.endPrice];
    }
    if(self.productInEbay)
    {
        self.objectRepr[EBAY_PRODUCT_KEY] = self.productInEbay.object;
    }
    if(self.title)
    {
        self.objectRepr[TITLE_KEY] = self.title;
    }
    PFFile* file = [PFFile fileWithData:self.imageData];
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(!error)
        {
            [self.objectRepr saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                complition(error);
            }];
        }
    }];
    
}
-(void)askProduct
{
    if(self.iAskedProduct == false)
    {
    self.iAskedProduct = true;
    [[self.objectRepr relationForKey:USER_ASKED]addObject:[PFUser currentUser]];
    }
    
}
@end
