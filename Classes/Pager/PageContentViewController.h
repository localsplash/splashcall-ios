//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by abc on 18/02/15.
//  Copyright (c) 2015 com.TheAppGuruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property  NSUInteger pageIndex;
@property  NSString *imgFile;
@property  NSString *txtTitle;
@property (weak, nonatomic) IBOutlet UIPageControl *pgCntrl;
@property (weak, nonatomic) IBOutlet UIImageView *ivScreenImage;
@property (weak, nonatomic) IBOutlet UILabel *lblScreenLabel;
@property (weak, nonatomic) IBOutlet UITextView *txtVWDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnNxt;

- (IBAction)btnNext:(id)sender;
+ (void) borderWithCornerRadius:(UITextField*)textField;
@end
