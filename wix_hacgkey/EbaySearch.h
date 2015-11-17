//
//  EbaySearch.h
//  wix_hacgkey
//
//  Created by לאון אגמון נכט on 13/11/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EbaySearch : NSObject <NSURLConnectionDelegate, NSURLSessionDelegate>
- (void)listEBayItems:(NSDictionary *)dictData;
@end
