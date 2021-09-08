//
//  Utils.h
//  PositionApp
//
//  Created by Riyaz Ahemad on 02/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.


#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface UtilsNew : NSObject {

}

+(NSString *)removeNull:(NSString *)str;
+ (void) showAlertView :(NSString*)title message:(NSString*)msg delegate:(id)delegate cancelButtonTitle:(NSString*)CbtnTitle otherButtonTitles:(NSString*)otherBtnTitles;
+ (void) showAlertViewWithTag:(NSInteger)tag title:(NSString*)title message:(NSString*)msg delegate:(id)delegate 
			cancelButtonTitle:(NSString*)CbtnTitle otherButtonTitles:(NSString*)otherBtnTitles;



+ (UIImage *)scaleImage:(UIImage *)image maxWidth:(int) maxWidth maxHeight:(int) maxHeight;
//+ (NSString*) stringFromImage:(UIImage*)image;
//+ (UIImage*) imageFromString:(NSString*)imageString;
+ (UIImage *)generatePhotoThumbnail:(UIImage *)image ;
//+ (NSString*) returnStringFromDate:(NSDate*)date;
+(void) viewUPWhenKeyboardAppearWithCoordinate:(CGFloat)y  withView:(UIView*)aView;

+ (void) stopActivityIndicatorInView:(UIView*)aView;
+ (void) startActivityIndicatorInView:(UIView*)aView withMessage:(NSString*)aMessage;


//+ (NSMutableArray *)fetchAllPhoneNumberfromAddBook:(ABMultiValueRef)ref;
//+ (NSDictionary*)fetchNamesEmailsAndPhonesFromAddressBook;
//+ (NSMutableArray *)getDistinctEmailForPerson:(ABRecordRef)record;
+ (NSString*)returnFirstCharacter:(NSString *)firstName withlName:(NSString *)lastName withPhoneArray:(NSMutableArray *)phoneArray withEmailArray:(NSMutableArray *)emailArray;
+ (BOOL) checkNetworkConnectivity;
+ (BOOL) checkServerConnectivity;

@end


@protocol MyDelegate

//-(void) getFullCategoryName:(NSString*) aCatName andMainCatID:(NSString*)aMainCatID subCatID:(NSString*)aSubCatID lowerCatId:(NSString*)aLowerCatID AllCategory:(NSString*)allcat;

@end

