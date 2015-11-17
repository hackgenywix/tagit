//
//  SearchEbayVC.m
//  wix_hacgkey
//
//  Created by לאון אגמון נכט on 13/11/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import "SearchEbayVC.h"
#import "EbaySearch.h"
@interface SearchEbayVC ()

@end

@implementation SearchEbayVC

- (void)viewDidLoad {
    EbaySearch *ebayFinder = [[EbaySearch alloc]init];
    [ebayFinder listEBayItems:nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
