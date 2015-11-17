//
//  ViewController.m
//  project
//
//  Created by DANIEL on 11/13/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import "ViewController.h"
#import "product.h"
#import "dataManager.h"
@interface ViewController ()


@end

@implementation ViewController
{
    dataManager* _sharedDataManager;
}
- (void)viewDidLoad {
    _sharedDataManager = [dataManager sharedDataManager];

    [_sharedDataManager getProductsWithComplition:^(NSError *error) {
        [self.tableView reloadData];
    }];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return [_sharedDataManager.products count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    product* p = _sharedDataManager.products[indexPath.row];
    static NSString *TableIdentifier = @"PRODUCTS_CELL";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifier];
    
    UILabel *cellTitle = (UILabel*)[cell viewWithTag:2];
    cellTitle.text = p.title;
    UIImageView *cellImage= (UIImageView*)[cell viewWithTag:3];
    cellImage.image = [UIImage imageWithData:p.imageData];

    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
}
@end
