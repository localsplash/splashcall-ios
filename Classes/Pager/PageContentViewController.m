//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by abc on 18/02/15.
//  Copyright (c) 2015 com.TheAppGuruz. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

@synthesize ivScreenImage,lblScreenLabel;
@synthesize pageIndex,imgFile,txtTitle;
@synthesize txtVWDescription,btnNxt;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.btnNxt.userInteractionEnabled = false;
    self.btnNxt.backgroundColor = UIColor.lightGrayColor;
    
    if (pageIndex == 2){
       
        self.btnNxt.userInteractionEnabled = true;
        self.btnNxt.backgroundColor = UIColor.blueColor;
        
    }
    self.ivScreenImage.image = [UIImage imageNamed:self.imgFile];
    self.lblScreenLabel.text = self.txtTitle;
    self.pgCntrl.currentPage = pageIndex;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnNext:(id)sender {
    
}

+ (void) borderWithCornerRadius:(UITextField*)textField{
    
    textField.layer.borderWidth = 2.0f;
    textField.layer.borderColor = [[UIColor redColor] CGColor];
    textField.layer.cornerRadius = 5;
    textField.clipsToBounds      = YES;
}
@end
