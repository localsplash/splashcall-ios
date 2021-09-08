//
//  RoamingMainPage_VC.h
//
//  Created by Gaurav Rai on 30/07/2015 .
//
//


#import <Foundation/Foundation.h>

@protocol WebServiceConnectorDelegate <NSObject>

-(void)WebServiceResult:(BOOL)success andError:(NSError *)error andResultData:(NSDictionary *)resultDictionary;


@optional
-(void)WebServiceResultWithAction:(BOOL)success andError:(NSError *)error andResultData:(NSDictionary *)resultDictionary andAction:(NSString *)action;

@end


@interface WebServiceConnector : NSObject <NSURLConnectionDataDelegate>
{
    NSMutableData *receivedData;
    NSString *serviceUrl;
    NSURLConnection *connection;
    
    id <WebServiceConnectorDelegate> delegate;
    
    NSString *serviceAction;
}

@property(retain) id delegate;

-(NSMutableURLRequest *)CreateRequest:(NSString *)service andHttpMethod:(NSString *)httpMethod andJsonData:(NSData *)jsonData;
-(NSMutableURLRequest *)CreateRequest:(NSString *)service andDictionary: (NSDictionary*)myDict;
-(void)executeInsert:(NSString *)serviceWithAction andData:(NSData *)data andAction:(NSString *)action;
-(WebServiceConnector *)init;
//-(void)executeUpdate:(NSString *)serviceWithAction andData:(NSData *)data andAction:(NSString *)action;
-(void)executeSelect:(NSString *)serviceWithAction andAction:(NSString *)action andDictionary:(NSDictionary*)dict;
- (BOOL) checkNetworkConnectivity;
@end



