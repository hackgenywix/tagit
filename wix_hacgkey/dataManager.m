//
//  dataManager.m
//  wix_hacgkey
//
//  Created by DANIEL on 11/13/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import <Parse/Parse.h>
#import "dataManager.h"
#import "product.h"
#define PRODUCT_TABLE_KEY @"products"
static dataManager* _sharedDataManager;
@implementation dataManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.products = [NSMutableArray array];
    }
    return self;
}
-(void)getProductsWithComplition:(void (^)(NSError *))complition
{
    PFQuery* query = [PFQuery queryWithClassName:PRODUCT_TABLE_KEY];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(!error)
        {
            for (PFObject* object in objects) {
                product* pro = [[product alloc]initWithPFObject:object];
                [self.products addObject:pro];
            }
            complition(error);
        }
        else
        {
            complition(error);
        }}];
    
}
+(dataManager*)sharedDataManager
{
    if (!_sharedDataManager)
    {
        _sharedDataManager = [[dataManager alloc]init];
        
    }
    return _sharedDataManager;
}

@end
