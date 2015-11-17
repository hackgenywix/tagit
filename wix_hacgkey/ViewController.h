//
//  ViewController.h
//  project
//
//  Created by DANIEL on 11/13/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource> {
    NSArray *productsData;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

