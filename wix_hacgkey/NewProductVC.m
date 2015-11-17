//
//  NewProductVC.m
//  wix_hacgkey
//
//  Created by לאון אגמון נכט on 13/11/15.
//  Copyright © 2015 daniel. All rights reserved.
//

#import "NewProductVC.h"

@interface NewProductVC ()

@end

@implementation NewProductVC

- (void)viewDidLoad {
    desTextField.borderStyle = UITextBorderStyleRoundedRect;
    titleTextField.borderStyle = UITextBorderStyleRoundedRect;
    conTextFiled.borderStyle = UITextBorderStyleRoundedRect;

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createProduct:(id)sender {
    //meltzer need to do
}

- (IBAction)chooseImage:(id)sender {
    UIImagePickerController *pickerLibrary = [[UIImagePickerController alloc] init];
    pickerLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerLibrary.delegate = self;
    [self presentModalViewController:pickerLibrary animated:YES];
    
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    UIImage *myImage = image;
}
@end
