//
//  WebConnection.h
//

#import <Foundation/Foundation.h>
#import "LinphoneAppDelegate.h"

@protocol WebRequestResult
-(void) webResponse:(NSDictionary*)responseDictionary;
@end

@interface WebConnection : NSObject
{

    __weak id<WebRequestResult> delegate;

    NSMutableData *webData;
    NSString *xmlData;
    LinphoneAppDelegate *appDelegate;
}

@property(weak,nonatomic)	id<WebRequestResult> delegate;
@property(strong,nonatomic) NSDictionary *responseDictionary;
-(void) makeConnection :(NSMutableURLRequest*)req;

@end
