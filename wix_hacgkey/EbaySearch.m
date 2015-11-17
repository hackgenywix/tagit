//
//  EbaySearch.m
//  wix_hacgkey
//
//  Created by לאון אגמון נכט on 13/11/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import "EbaySearch.h"

@interface EbaySearch()
@property (strong, nonatomic) NSURLConnection *connection;
@property (strong, nonatomic) NSMutableData *receivedData;

@end


@implementation EbaySearch

- (void)listEBayItems:(NSDictionary *)dictData {
    
    self.receivedData = [[NSMutableData alloc]init];
    
    //dictData is going to be used to set the search keywords BUT, for demo, its hard-coded to harry potter phoenix
    
    NSString *strURL = @"http://svcs.sandbox.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.1&SECURITY-APPNAME=eBay84992-1777-419b-9ae6-b6511a3f4ee&RESPONSE-DATA-FORMAT=JSON&itemFilter.paramName=minPrice&itemFilter.paramValue=200&keywords=iphone";
    
    NSURL *url = [NSURL URLWithString:strURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.connection = connection;
    [connection start];
}



-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [self.receivedData appendData:data];
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"%@" , error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"DEBUG : %@" , @"connectionDidFinishLoading");
    NSString* strData = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"%@" , strData);
}
@end
