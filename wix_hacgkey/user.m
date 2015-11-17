//
//  user.m
//  project
//
//  Created by DANIEL on 11/13/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import "user.h"
#import "product.h"
#import <Parse/Parse.h>
#define RANK_KEY @"rank"
#define USER_KEY @"username"
#define PRODUCTS_FOUND_BY_USER @"productsFoundByUser"
#define PRODUCTS_ASKED_BY_USER @"productsAskedByUser"
@implementation user
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.productsAskedByUser = [NSMutableArray array];
        self.productsFoundByUser = [NSMutableArray array];
    }
    return self;
}
- (instancetype)initWithPFObject:(PFObject*)object
{
    self = [super init];
    if (self) {
        self.rank = [object[RANK_KEY]doubleValue];
        self.userName = object[USER_KEY];
        self.productsAskedByUser = [NSMutableArray array];
        self.productsFoundByUser = [NSMutableArray array];
    }
    return self;
}
-(void)loginUserWithComplition:(void (^)(NSError *))complition
{
    [PFUser logInWithUsernameInBackground:self.userName password:self.password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
        self.user = user;
        if(!error)
        {
            [self getProductsAskedByUserWithComplition:^(NSError *error) {
                if(!error)
                {
                    [self getProductsFoundByUserWithComplition:^(NSError *error) {
                        complition(error);
                    }];
                }
                else
                {
                    complition(error);
                }
            }];
        }
        else
        {
        complition(error);
        }
    }];
}
-(void)getProductsFoundByUserWithComplition:(void (^) (NSError* error))complition
{
    PFRelation* realtion = self.user[PRODUCTS_FOUND_BY_USER];
    [[realtion query]findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(!error)
        {
        for (PFObject* object in objects) {
            [self.productsFoundByUser addObject:[[product alloc]initWithPFObject:object]];
        }
        
        }complition(error);
    }];
}
-(void)getProductsAskedByUserWithComplition:(void (^)(NSError *))complition
{
    PFRelation* realtion = self.user[PRODUCTS_ASKED_BY_USER];
    [[realtion query]findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(!error)
        {
            for (PFObject* object in objects) {
                [self.productsAskedByUser addObject:[[product alloc]initWithPFObject:object]];
            }
            
        }complition(error);
    }];

}
@end
