//
//  dataManager.h
//  wix_hacgkey
//
//  Created by DANIEL on 11/13/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataManager : NSObject
-(void)getProductsWithComplition:(void (^) (NSError* error))complition;
@property (strong,nonatomic)NSMutableArray* products;
+(dataManager*)sharedDataManager;
@end
