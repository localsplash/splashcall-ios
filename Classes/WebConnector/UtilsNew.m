//
//  Utils.m
//  PositionApp
//
//  Created by Riyaz Ahemad on 02/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UtilsNew.h"
//#import "GSNSDataExtensions.h"
#import "MBProgressHUD.h"
//#import "ContactModelObject.h"
#import "defines.h"
#import "ReachabilityNew.h"


#define MOVE_ANIMATION_DURATION_SECONDS_FOR_C1 .5

@implementation UtilsNew


+(NSString *)removeNull:(NSString *)str
{
    str = [NSString stringWithFormat:@"%@",str];
    if (!str)
    {
        return @"";
    }
    else if([str isEqualToString:@"(null)"])
    {
        return @"";
    }
    else if([str isEqualToString:@"<null>"])
    {
        return @"";
    }
    else
    {
        return str;
    }
}




#pragma mark -
////----- show a alert massage
+ (void) showAlertView :(NSString*)title message:(NSString*)msg delegate:(id)delegate 
													cancelButtonTitle:(NSString*)CbtnTitle otherButtonTitles:(NSString*)otherBtnTitles
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:delegate 
										  cancelButtonTitle:CbtnTitle otherButtonTitles:otherBtnTitles, nil];
	[alert show];
	//[alert release];
}

+ (void) showAlertViewWithTag:(NSInteger)tag title:(NSString*)title message:(NSString*)msg delegate:(id)delegate 
      cancelButtonTitle:(NSString*)CbtnTitle otherButtonTitles:(NSString*)otherBtnTitles
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:delegate 
										  cancelButtonTitle:CbtnTitle otherButtonTitles:otherBtnTitles, nil];
    alert.tag = tag;
	[alert show];
	//[alert release];
}





#pragma mark - Image Resize 
+ (UIImage *)scaleImage:(UIImage *)image maxWidth:(int) maxWidth maxHeight:(int) maxHeight
{
    CGImageRef imgRef = image.CGImage;
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
	
    if (width <= maxWidth && height <= maxHeight)
	{
		return image;
	}
	
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
	
    if (width > maxWidth || height > maxHeight)
	{
		CGFloat ratio = width/height;
		
		if (ratio > 1)
		{
			bounds.size.width = maxWidth;
			bounds.size.height = bounds.size.width / ratio;
		}
		else
		{
			bounds.size.height = maxHeight;
			bounds.size.width = bounds.size.height * ratio;
		}
	}
	
    CGFloat scaleRatio = bounds.size.width / width;
    UIGraphicsBeginImageContext(bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, scaleRatio, -scaleRatio);
    CGContextTranslateCTM(context, 0, -height);
    CGContextConcatCTM(context, transform);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
	
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	
    return imageCopy;
	
}

#pragma mark Image Conversion
/*+ (NSString*) stringFromImage:(UIImage*)image
{
	NSData* imageData = UIImagePNGRepresentation(image);
	//NSData *imageData = UIImageJPEGRepresentation(image, 1);
	NSString* str = [imageData base64EncodingWithLineLength:80];
	return str;
}*/

/*+ (UIImage*) imageFromString:(NSString*)imageString
{
	NSData* imageData = [NSData dataWithBase64EncodedString:imageString];
	return [UIImage imageWithData: imageData];
}*/

#pragma mark - Use it when pickup an image from imagepicker
+ (UIImage *)generatePhotoThumbnail:(UIImage *)image 
{
	//int kMaxResolution = 320; 
	
	CGImageRef imgRef = image.CGImage; 
	
	CGFloat width = CGImageGetWidth(imgRef); 
	CGFloat height = CGImageGetHeight(imgRef); 
	
	CGAffineTransform transform = CGAffineTransformIdentity; 
	CGRect bounds = CGRectMake(0, 0, width, height); 
	/*if (width > kMaxResolution || height > kMaxResolution) 
	 { 
	 CGFloat ratio = width/height; 
	 if (ratio > 1)
	 { 
	 bounds.size.width = kMaxResolution; 
	 bounds.size.height = bounds.size.width / ratio; 
	 } 
	 else
	 { 
	 bounds.size.height = kMaxResolution; 
	 bounds.size.width = bounds.size.height * ratio; 
	 } 
	 } */
	
	CGFloat scaleRatio = bounds.size.width / width; 
	CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));  
	CGFloat boundHeight;                       
	UIImageOrientation orient = image.imageOrientation;                         
	switch(orient)
	{ 
		case UIImageOrientationUp: //EXIF = 1 
			transform = CGAffineTransformIdentity; 
			break;
			
		case UIImageOrientationUpMirrored: //EXIF = 2  
			transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0); 
			transform = CGAffineTransformScale(transform, -1.0, 1.0); 
			break; 
			
		case UIImageOrientationDown: //EXIF = 3 
			transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height); 
			transform = CGAffineTransformRotate(transform, M_PI); 
			break; 
			
		case UIImageOrientationDownMirrored: //EXIF = 4 
			transform = CGAffineTransformMakeTranslation(0.0, imageSize.height); 
			transform = CGAffineTransformScale(transform, 1.0, -1.0); 
			break; 
			
		case UIImageOrientationLeftMirrored: //EXIF = 5 
			boundHeight = bounds.size.height; 
			bounds.size.height = bounds.size.width; 
			bounds.size.width = boundHeight; 
			transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width); 
			transform = CGAffineTransformScale(transform, -1.0, 1.0); 
			transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0); 
			break; 
			
		case UIImageOrientationLeft: //EXIF = 6 
			boundHeight = bounds.size.height; 
			bounds.size.height = bounds.size.width; 
			bounds.size.width = boundHeight; 
			transform = CGAffineTransformMakeTranslation(0.0, imageSize.width); 
			transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0); 
			break; 
			
		case UIImageOrientationRightMirrored: //EXIF = 7 
			boundHeight = bounds.size.height; 
			bounds.size.height = bounds.size.width; 
			bounds.size.width = boundHeight; 
			transform = CGAffineTransformMakeScale(-1.0, 1.0); 
			transform = CGAffineTransformRotate(transform, M_PI / 2.0); 
			break; 
			
		case UIImageOrientationRight: //EXIF = 8 
			boundHeight = bounds.size.height; 
			bounds.size.height = bounds.size.width; 
			bounds.size.width = boundHeight; 
			transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0); 
			transform = CGAffineTransformRotate(transform, M_PI / 2.0); 
			break; 
		default: 
			[NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"]; 
			break;
	} 
	
	UIGraphicsBeginImageContext(bounds.size); 
	
	CGContextRef context = UIGraphicsGetCurrentContext(); 
	
	if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft)
	{ 
		CGContextScaleCTM(context, -scaleRatio, scaleRatio); 
		CGContextTranslateCTM(context, -height, 0); 
	} 
	else
	{ 
		CGContextScaleCTM(context, scaleRatio, -scaleRatio); 
		CGContextTranslateCTM(context, 0, -height); 
	} 
	
	CGContextConcatCTM(context, transform); 
	
	CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef); 
	UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext(); 
	UIGraphicsEndImageContext(); 
	
	return imageCopy;
	
}
//
//+ (NSString*) returnStringFromDate:(NSDate*)date
//{
//	
//	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//	[dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//	//[dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss a"];
//   	NSString *strDateTime = [dateFormatter stringFromDate:date];
//	//[dateFormatter release];
//	return strDateTime;
//}


+(void) viewUPWhenKeyboardAppearWithCoordinate:(CGFloat)y  withView:(UIView*)aView
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	
	aView.transform=CGAffineTransformConcat(CGAffineTransformMakeTranslation(0, y), CGAffineTransformMakeRotation(0));
	[UIView commitAnimations];
	
}


+ (void) stopActivityIndicatorInView:(UIView*)aView
{
    [MBProgressHUD hideHUDForView:aView animated:YES];

}





+ (void) startActivityIndicatorInView:(UIView*)aView withMessage:(NSString*)aMessage
{
    
    
    MBProgressHUD *_hud = [MBProgressHUD showHUDAddedTo:aView animated:YES];
    _hud.labelText = aMessage;
    
        
   // _hud.dimBackground = YES;
    
}


#pragma mark - Dealing With Address Book

/*+ (NSMutableArray *)fetchAllPhoneNumberfromAddBook:(ABMultiValueRef)ref
{
    
    NSMutableArray *phoneArray = [[NSMutableArray alloc] init];
    for(CFIndex j = 0; j < ABMultiValueGetCount(ref); j++)
    {
        
        CFStringRef phoneNumberRef = ABMultiValueCopyValueAtIndex(ref, j);
        CFStringRef locLabel = ABMultiValueCopyLabelAtIndex(ref, j);
        NSString *phoneLabel =(__bridge NSString*) ABAddressBookCopyLocalizedLabel(locLabel);
        //CFRelease(phones);
        NSString *phoneNumber = (__bridge NSString *)ABMultiValueCopyValueAtIndex(ref, j);
        CFRelease(phoneNumberRef);
        if(locLabel)CFRelease(locLabel);
        NSString *phoneValue = [NSString stringWithFormat:@"%@",phoneNumber];
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:phoneValue,kPhoneNumber,phoneLabel,kPhoneType,@"0",kPhEmailisSelected,@"phone",kPhone, nil];
        [phoneArray addObject:dic];
//        if(phoneNumber)[phoneNumber release];
//        if(phoneLabel)[phoneLabel release];
    }
    
    return phoneArray;
}
*/

//+ (NSDictionary*)fetchNamesEmailsAndPhonesFromAddressBook
//{
//    NSMutableArray*   prefixNameArray = [NSMutableArray arrayWithObjects:@"Mr.",@"Miss.",@"Dr.",@"Mrs.",@"Er.",@"Mr",@"Miss",@"Dr",@"Mrs",@"Er", nil];
//    
//    
//                 /*After Update ios 8*/
//    
//    
//   // ABAddressBookRef addressBook = ABAddressBookCreate();
//    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
//    
//    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
//        
//    });
//    CFArrayRef all = ABAddressBookCopyArrayOfAllPeople(addressBook);
//    CFIndex n = ABAddressBookGetPersonCount(addressBook);
//    NSMutableDictionary *contactDict = [[NSMutableDictionary alloc]init];
//    for( int i = 0 ; i < n ; i++ )
//    {
//        ABRecordRef ref = CFArrayGetValueAtIndex(all, i);
//        NSData  *personImg = nil;
//        personImg = (__bridge NSData *)ABPersonCopyImageData(ref);
//        NSNumber *recordId =  [NSNumber numberWithInteger:ABRecordGetRecordID(ref)];
//        
//        NSString *firstName = (__bridge NSString *)ABRecordCopyValue(ref, kABPersonFirstNameProperty);
//        NSString *lastName = (__bridge NSString *)ABRecordCopyValue(ref, kABPersonLastNameProperty);
//        
//        if(firstName != NULL && (firstName.length > 0))
//        {
//            NSArray* localArray = [firstName componentsSeparatedByString:@" "];
//            if (localArray.count > 1)
//            {
//                BOOL isExist = [prefixNameArray containsObject:[localArray objectAtIndex:0]];
//                if (isExist)
//                {
//                    firstName = [firstName stringByReplacingOccurrencesOfString:[localArray objectAtIndex:0] withString:@" "];
//                    NSCharacterSet *whitespace = [NSCharacterSet whitespaceCharacterSet];
//                    firstName = [firstName stringByTrimmingCharactersInSet:whitespace] ;
//                }
//            }
//        }
//        
//
//        ABMultiValueRef phonesRef = ABRecordCopyValue(ref, kABPersonPhoneProperty);
//        NSMutableArray *phoneArray = [self fetchAllPhoneNumberfromAddBook:phonesRef];
//        NSMutableArray *emailArray = [self getDistinctEmailForPerson:ref];
//        
//        NSString *sortString = [NSString stringWithFormat:@"%@",[self returnFirstCharacter:firstName withlName:lastName withPhoneArray:phoneArray withEmailArray:emailArray]];
//        
//        unichar firstAlphabet =  toupper([sortString characterAtIndex:0]);
//        
//        if((firstName == NULL) && (lastName == NULL) && ([emailArray count] == 0) && ([phoneArray count] ==0)){
//            firstName = @"NO Name";
//        }
//        if(firstName == NULL)firstName = @"";
//        if(lastName == NULL)lastName = @"";
//        
//        NSMutableArray* temp = [contactDict objectForKey:[NSString stringWithFormat:@"%c",firstAlphabet]];
//        if([temp count]!=0)
//        {
//            [temp addObject:[ContactModelObject contactWithName:firstName lName:lastName phone:phoneArray emailId:emailArray withAddressBookId:[recordId integerValue] andButtonCheked:NO]];
//            [contactDict setObject:temp forKey:[NSString stringWithFormat:@"%c",firstAlphabet]];
//        }
//        else
//        {
//            [contactDict setObject:[NSMutableArray arrayWithObject:[ContactModelObject contactWithName:firstName lName:lastName phone:phoneArray emailId:emailArray  withAddressBookId:[recordId integerValue] andButtonCheked:NO]] forKey:[NSString stringWithFormat:@"%c",firstAlphabet]];
//        }
//        
//        CFRelease(phonesRef);
////        if(firstName)[firstName release];
////        if(lastName)[lastName release];
////        if (personImg)[personImg release];
//    }
//    
//    CFRelease(addressBook);
//    CFRelease(all);
//    
//    for (int cCount = 0; cCount < [[contactDict allKeys] count]; cCount++ )
//    {
//        NSSortDescriptor *sortDescFName = [[NSSortDescriptor alloc] initWithKey:@"fName" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
//        [[contactDict objectForKey:[[contactDict allKeys] objectAtIndex:cCount]] sortUsingDescriptors:[NSArray arrayWithObject:sortDescFName]];
////        [sortDescFName release];
//        
//        //        NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:@"sortString" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
//        //        [[contactDict objectForKey:[[contactDict allKeys] objectAtIndex:cCount]] sortUsingDescriptors:[NSArray arrayWithObject:sortDesc]];
//        //        [sortDesc release];
//        
//    }
//    
//    return contactDict;
//}
//


//+ (NSMutableArray *)getDistinctEmailForPerson:(ABRecordRef)record
//{
//    //Create the array where emails will be stored
//    NSMutableArray *emailArray = [[NSMutableArray alloc] init] ;
//    NSMutableArray *localEmailArray = [[NSMutableArray alloc] init];
//    
//    // Get the email properties
//    ABMultiValueRef mails = ABRecordCopyValue(record, kABPersonEmailProperty);
//    
//    for (int i=0; i<ABMultiValueGetCount(mails); i++)
//    {
//        NSString *mail        = (__bridge NSString *) ABMultiValueCopyValueAtIndex(mails, i);
//        NSString *emailType =(__bridge NSString*) ABMultiValueCopyLabelAtIndex(mails, i);
//        NSString* clipEmailType = nil;
//        
//        if (([emailType length] > 0) && !([emailType rangeOfString:@"<"].location == NSNotFound) && !([emailType rangeOfString:@">"].location == NSNotFound)) {
//            clipEmailType = [[[[emailType componentsSeparatedByString:@"<"] objectAtIndex:1] componentsSeparatedByString:@">"] objectAtIndex:0];
//            
//        } else {
//            
//            if([emailType length] > 0)
//                clipEmailType = [NSString stringWithFormat:@"%@",emailType];
//        }
//        
//        BOOL isObjectExists = [localEmailArray containsObject:mail];
//        if (!isObjectExists)
//        {
//            NSMutableDictionary *emailDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:mail,kEmailId,clipEmailType,kEmailType,@"0",kPhEmailisSelected,@"email",kemail, nil];
//            [emailArray addObject:emailDict];
//            [localEmailArray addObject:mail];
//        }
////        if(mail)[mail release];
////        if (emailType){[emailType release];}
//    }
//    if(mails)CFRelease(mails);
//    
//    return emailArray;
//}

+ (NSString*)returnFirstCharacter:(NSString *)firstName withlName:(NSString *)lastName withPhoneArray:(NSMutableArray *)phoneArray withEmailArray:(NSMutableArray *)emailArray
{
    
    NSString *firstAlphabet;
    if(firstName != NULL && (firstName.length > 0))
    {
        firstAlphabet = [NSString stringWithFormat:@"%@",firstName];
    } else if (lastName != NULL && lastName.length > 0){
        firstAlphabet = [NSString stringWithFormat:@"%@",lastName];
    } else if ([emailArray count] > 0) {
        
        firstAlphabet = [NSString stringWithFormat:@"#"];
        // firstAlphabet = [NSString stringWithFormat:@"%@",[[emailArray objectAtIndex:0] valueForKey:kEmailId]];
    }
    else if ([phoneArray count] > 0) {
        
        firstAlphabet = [NSString stringWithFormat:@"#"];
    } else
    {
        //firstAlphabet = [@"#" characterAtIndex:0];
        firstAlphabet = [NSString stringWithFormat:@"#"];
    }
    
    return firstAlphabet;
}

#pragma mark - Internet Connectivity Validation method

+ (BOOL) checkNetworkConnectivity
{
    ReachabilityNew *r = [ReachabilityNew reachabilityWithHostName:@"www.apple.com"];
	NetworkStatus internetStatus = [r currentReachabilityStatus];
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN))
	{
        return NO;
	}
    else
        return YES;
}


+ (BOOL) checkServerConnectivity
{
    ReachabilityNew *r = [ReachabilityNew reachabilityWithHostName:@"ip.roaming4world.com"];
	NetworkStatus internetStatus = [r currentReachabilityStatus];
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN) )
	{
        return NO;
	}
    else
        return YES;
}



@end
