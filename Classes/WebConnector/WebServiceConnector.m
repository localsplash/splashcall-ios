
//  RoamingMainPage_VC.h
//  Created by Gaurav Rai on 30/07/2015 .



#import "WebServiceConnector.h"
//#import "NSObject+SBJSON.h"
//#import "NSString+SBJSON.h"
#import "ReachabilityNew.h"
#import "defines.h"
//#import "SBJSON.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
//#import "WS_EnterSimNo_Vc.h"

@implementation WebServiceConnector

@synthesize delegate;

-(WebServiceConnector *)init
{
    self = [super init];
    if (self) {
        serviceUrl = @"http://ip.roaming4world.com/esstel/receive.php?";
    }
    return self;
}

- (BOOL) checkNetworkConnectivity
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



#pragma mark- Service call for GET Method

-(void)executeSelect:(NSString *)serviceWithAction andAction:(NSString *)action andDictionary:(NSDictionary*) dict
{
    serviceAction = serviceWithAction;
    
    NSMutableURLRequest *request = [self CreateRequest:serviceWithAction andDictionary:dict];
    
    
    connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
    if (connection) {
        receivedData = [[NSMutableData alloc] init];
    }
    else
    {
        NSError *error = [[NSError alloc]initWithDomain:@"Connection failed!!" code:0001 userInfo:nil];
        [[self delegate] WebServiceResult:false andError:error andResultData:nil ];
        //[error release];
    }
}

-(NSMutableURLRequest *)CreateRequest:(NSString *)service andDictionary:(NSDictionary*)myDict
{
    if([service isEqualToString:kActivate])
    {
        NSMutableString* theString = [NSMutableString string];
        [theString appendString:[NSString stringWithFormat:@"%@from=",serviceUrl]];
        [theString appendString:[NSString stringWithFormat:@"%@",[myDict objectForKey:kCountryCode]]];
        [theString appendString:[NSString stringWithFormat:@"%@",[myDict objectForKey:kPhoneNumber1]]];
        [theString appendString:[NSString stringWithFormat:@"%s","&message=ETEL%20A%20"]];
        [theString appendString:[NSString stringWithFormat:@"%@",[myDict objectForKey:kPin]]];
        [theString appendString:[NSString stringWithFormat:@"%s","&format=json&cc="]];
        
        [theString appendString:[NSString stringWithFormat:@"%@",[myDict objectForKey:kCountryCode]]];
        [theString appendString:[NSString stringWithFormat:@"%s","&cname="]];
        
        
     
        NSString* changeString = [myDict objectForKey:kCountryName];
        
        if ([[myDict objectForKey:kCountryName] rangeOfString:@" "].location == NSNotFound)
        {
            
        }
        
        else
        {
            changeString = [changeString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            
        }
        [theString appendString:[NSString stringWithFormat:@"%@",changeString]];
        [theString appendString:[NSString stringWithFormat:@"&lat=%@&lng=%@",[myDict objectForKey:kLatitude],[myDict objectForKey:kLongitude]]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:theString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.0];
        return request;
       
    }
     
    else
    {
        
        NSMutableString* theString = [NSMutableString string];
        NSString*serviceUrl1=@"";
        [theString appendString:[NSString stringWithFormat:@"%@pinno=",serviceUrl1]];
        [theString appendString:[NSString stringWithFormat:@"%@",[myDict objectForKey:kPin]]];
        [theString appendString:[NSString stringWithFormat:@"&lat=%@&lng=%@",[myDict objectForKey:kLatitude],[myDict objectForKey:kLongitude]]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:theString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.0];
        
        return request;
    }

    return nil;
}





#pragma mark- Service Call for Post Method

-(void)executeInsert:(NSString *)serviceWithAction andData:(NSData *)data andAction:(NSString *)action
{
    serviceAction = action;
    
    NSMutableURLRequest *request = [self CreateRequest:serviceWithAction andHttpMethod:@"POST" andJsonData:data];
    
    
    connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
    
    if (connection) {
        receivedData = [[NSMutableData alloc] init];
    }
    else
    {
        NSError *error = [[NSError alloc]initWithDomain:@"Connection failed!!" code:0001 userInfo:nil];
        [[self delegate] WebServiceResult:false andError:error andResultData:nil ];
        if ([[self delegate] respondsToSelector:@selector(WebServiceResultWithAction:andError:andResultData:andAction:)])
        {
            [[self delegate] WebServiceResultWithAction:false andError:error andResultData:nil andAction:action];
        }
       // [error release];
    }
    
 }


-(NSMutableURLRequest *)CreateRequest:(NSString *)service andHttpMethod:(NSString *)httpMethod andJsonData:(NSData *)jsonData
{
   
    NSDictionary* testDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil] ;
    NSMutableString   *requestBody = [[NSMutableString alloc] init];
    [requestBody appendString:[NSString stringWithFormat:@"self_contact=%@",[testDict objectForKey:kSelfContact]]];
   // [testDict release];
    NSString* requestBodyString = [NSString stringWithString:requestBody];
    NSData *requestData = [NSData dataWithBytes: [requestBodyString UTF8String] length: [requestBodyString length]];
    NSString*finalString=[serviceUrl stringByAppendingString:requestBody];
 
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.0];
    [request setHTTPMethod:httpMethod];
    //[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    //[request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    //[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    //[request setHTTPBody: [temp dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody: requestData ];
    //[request setHTTPBody:[NSJSONSerialization dataWithJSONObject:finalTestDict options:0 error:nil]];];
      //[finalString release];
      //[requestBody release];
    return request;
}




#pragma mark- NSURL Connection Delegate Methods

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(!receivedData)
    {
          receivedData = [[NSMutableData alloc] init];
    }
  
    [receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
   
    [[self delegate] WebServiceResult:false andError:error andResultData:nil ];
    if ([[self delegate] respondsToSelector:@selector(WebServiceResultWithAction:andError:andResultData:andAction:)]) {
        [[self delegate] WebServiceResultWithAction:false andError:error andResultData:nil andAction:serviceAction];
    }
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
   
    NSString *data = [[NSString alloc]initWithData:receivedData encoding:NSUTF8StringEncoding];
    NSError *errorJson = nil;
    NSDictionary *jsonObjects = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:&errorJson];
    NSDictionary* resultDict = [[NSDictionary alloc]initWithObjectsAndKeys:data,@"response", nil];
    NSLog(@" response %@",resultDict);
    //[data release];
    resultDict = jsonObjects;
   
    [[self delegate] WebServiceResult:true andError:nil andResultData:resultDict ];
    if ([[self delegate] respondsToSelector:@selector(WebServiceResultWithAction:andError:andResultData:andAction:)])
    {
        [[self delegate] WebServiceResultWithAction:false andError:nil andResultData:resultDict andAction:serviceAction];
        
       
        
    }
   // [data release];
    
 }

- (NSString*) removeLeadingZeroFromDId:(NSString *)activationNmbr
{
    NSString *str = activationNmbr ;
    NSString *firstLetter = [activationNmbr substringToIndex:1];
    
    if([firstLetter isEqualToString:@"0"])
    {
        activationNmbr = [str substringFromIndex:1];
    }
    return activationNmbr;
}




@end
