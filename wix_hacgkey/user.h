//
//  user.h
//  project
//
//  Created by DANIEL on 11/13/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
@interface user : NSObject
@property (strong,nonatomic)PFUser* user;
@property (assign,nonatomic)double rank;
@property (strong,nonatomic)NSMutableArray* productsAskedByUser;
@property (strong,nonatomic)NSMutableArray* productsFoundByUser;
@property (copy,nonatomic)NSString* userName;
@property (copy,nonatomic)NSString* password;
- (instancetype)initWithPFObject:(PFObject*)object;
-(void)loginUserWithComplition:(void (^)(NSError* error))complition;
-(void)getProductsAskedByUserWithComplition:(void (^) (NSError* error))complition;
-(void)getProductsFoundByUserWithComplition:(void (^) (NSError* error))complition;

@end
