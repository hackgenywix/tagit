//
//  ebayProduct.h
//  project
//
//  Created by DANIEL on 11/13/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
@interface ebayProduct : NSObject
- (instancetype)initWithPFObject:(PFObject*)object;
@property (strong,nonatomic)PFObject* object;
@end
