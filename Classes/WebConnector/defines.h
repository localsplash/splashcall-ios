//
//  defines_h.h
//  zortag
//
//  Created by Nishank on 24/08/12.
//  Copyright (c) 2012 Nishank. All rights reserved.
//


//alert with only message
#define DisplayAlert(msg) { UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alertView show]; [alertView autorelease];}
//alert with message and title
#define DisplayAlertWithTitle(msg,title){UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alertView show]; [alertView autorelease];}

#define	_InValidateTimer(obj)				if (obj) { [obj invalidate]; obj = nil; }
#define	_ReleaseObject(obj)					if (obj) { [obj release]; obj = nil; }




//--- Utils key values
#define kPhoneNumber                @"contactvalue"
#define kPhoneType                  @"contacttype"
#define kEmailId                    @"contactvalue"
#define kEmailType                  @"contacttype"
#define kPhone                      @"phone"
//#define kEmail              @"email"

#define kPhEmailisSelected          @"isSelected"
#define kNotifyType                 @"NotifyType"
#define kNotifyValue                @"NotifyValue"



#define kdata                       @"data"
#define kerror                      @"error"
#define kresult                     @"result"
#define ksuccess                    @"Success"
#define kmassage                    @"message"

#define kplayerId                   @"player_id"


#define kemail                      @"email"
#define kRank                       @"rank"

#define kname                       @"name"
#define ksurname                    @"surname"
#define kusername                   @"username"

#define ktoken                      @"token"

#define kimageURL                   @"picture"


#define kRequestType                @"RequestType"
#define kIsRegistered               @"isRegistered"
#define kIsActivated                @"isActivated"

#define kimageData                  @"imageData"

#define kActivate                   @"activate"
#define kMap                        @"map"
#define kDeactivate                 @"deactivate"
#define kCDR                        @"CDR"
#define kFetchPin                   @"fetch_pin"
#define kPhoneNumber1               @"phoneNumber"
#define kPin                        @"pin"
#define kCountryName                @"countryName"
#define kCountryCode                @"countryCode"
#define kActivationNumber           @"activationNumber"
#define kCallDescription            @"CallDescription"
#define kActivationSwitch           @"activationSwitch"
#define kPinInfo                    @"pinInfo"
#define kLatitude                   @"Latitude"
#define kLongitude                  @"Longitude"
#define kLocalNotificationFlag      @"NotificationFlag"
#define kLowBalanceFlag             @"LowBalance"
#define kSelectedValidity           @"SelectedValidity"
#define kSelectedTopup              @"SelectedTopup"
#define kSelectedAmount             @"SelectedAmount"
#define kValidity                   @"Validity"
#define kTopup                      @"Topup"
#define kAmount                     @"Amount"
#define kRechargePin                @"RechargePin"
#define kRechargeConfirmation       @"RechargeConfirmation"
#define kRechargeTransID            @"RechargeTransactionID"
#define kNewPin                     @"newPin"
#define kRechargeFlag               @"RechargeFlag"
#define kRechargePlanCode           @"RechargePlanCode"


//Payment Gateway Key Names
#define kpaypal_sdk_version         @"paypal_sdk_version"
#define kenvironment                @"environment"
#define kplatform                   @"platform"
#define kproduct_name               @"product_name"
#define kapp_id                     @"app_id"
#define kpayment_exec_status        @"payment_exec_status"
#define kpay_key                    @"pay_key"
#define ktimestamp                  @"timestamp"
#define kshort_description          @"short_description"
#define kamount                     @"amount"
#define kcurrency_code              @"currency_code"
#define kstate                      @"state"
#define kpayment_id                 @"payment_id"
#define kclient                     @"client"
#define kproof_of_payment           @"proof_of_payment"
#define kadaptive_payment           @"adaptive_payment"
#define kpayment                    @"payment"
#define krest_api                   @"rest_api"
#define kCheckPromotion             @"checkPromotion"
#define kEnableOrDisablePromotionPin  @"EnableOrDisablePromotionPin"
#define kPushNotification           @"PushNotification"
#define kAuthenticateActivation     @"AuthenticateActivation"
#define kInitiateCallActivateAuth   @"InitiateCallForwardActivateAuthentication"
#define kUpdateUserInfo             @"UpdateUserInfo"
#define kMappedCN                   @"MappedCountryName"
#define kMappedCC                   @"MappedCountryCode"
#define kGetCN                      @"GetCountryName"
#define kSignUpNumber               @"username"
#define kSignUp                     @"SignUp"
#define kSignUpCountry              @"SignUpCountry"
//#define kSignUpCountryCode          @"SignUpCountryCode"
#define kVerifySignUp               @"VerifySignUp"
#define kVerificationCode           @"VerificationCode"
#define kVerifySignUpByPhone        @"VerifySignUpByPhone"
#define kSelectedPId                @"selectedPId"
#define kCheckVoicemailStatus       @"VoicemailStatus"
#define kAllVoicemails              @"AllVoicemails"
#define kActivateVoicemail          @"activateVoicemail"
#define kDeactivateVoicemail        @"deactivateVoicemail"
#define kVoicemailDeleteAck         @"VoicemailDeleteAck"
#define kMessageName                @"MessageName"
#define kWeatherInfo                @"WeatherInfo"
#define kFlightInfo                 @"FlightInfo"
#define kFlightInput                @"FlightInput"
#define kDepartureTerminal          @"departureTerminal"
#define kArrivalTerminal            @"arrivalTerminal"
#define kFlightInformation          @"flightInformation"
#define kAirlineName                @"airlineName"
#define kFlightNo                   @"FlightNo"
#define kAirportName                @"airportName"
#define kCarrierCode                @"carrierCode"
#define kFlightRunningStatus        @"flightRunningStatus"
#define kFlightProgressMsg          @"Flight In Progress"
#define kSelectedFlightDate         @"selectedFlightDate"

//////////MB Telecom //////////////////
#define kLogoImage @"logo.png"
#define kScreenNumber @"screenNumber"
#define kTitle @"MBG Talk"
#define kLoginService   @"Login"
#define kSignUpService @"SignUpMB_TEL"
#define kBalanceService @"BalanceService"
#define KBalanceShow   @"BalanceShow"
#define kUserPhone  @"userPhone"
#define KNumber  @"number"
#define KPhoneNumber @"PhoneNumber"
#define kSignUpUsername @"Username"
#define kSignUpCountryName  @"countryName"
#define kSignUpEmail    @"email"
#define kSignUpPassword     @"password"
#define kLoginUsername      @"username"
#define kLoginPassword      @"Password"
#define kCountryDialName              @"CountryName"
#define kCountryDialCode          @"CountryCode"

#define KAllMobileNumber @"AllMobileNumber"
#define KSendContacts  @"SendContacts"
#define KMbtelContacts @"MbtelContacts"
#define kAllMBTELContacts   @"Mbtel_Contacts"

#define kContactArray @"contact_array"
#define kContactString @"contact_string"
#define kSelfContact    @"self_contact"
#define kGetContacts  @"mbtel_contacts"
#define kMobile     @"mobileNumber"
#define kAllSent    @"allsent"
#define kFirstTimeTrue  @"firsttime"
#define KResultDictionary @"resultDictionary"
#define kMBTEL_OUT  @"mbtel_out"
#define kFREE_CALL  @"FREE_CALL"
#define kSelectedCallOption @"call_option"
#define kFLAGForTerminate  @"FLAG_FOR_CALL_TERMINATION"
#define KContacts_Mbtel @"Contacts_Mbtel"
#define kAreContactsAlreadyLoaded   @"isLoaded"
#define kMBTELContactsStatuses      @"MBTEL_CONTACT_STATUS"
#define kMBContactThumnailArray     @"MBContact_Thumbnail_Array"
#define kMBContactsStatusArray  @"MBTEL_CONTACT_STATUS_ARRAY"
#define kMBThumbnailPath     @"MBThumbnailPath"
#define KMBContactsUserNameArray  @"MBContactsUserNameArray"
#define kMBContactsBaseURL   @"MBContactsBaseURL"

#define kMatchedMBNumberInfo   @"MatchedContactNumberInfo"


#define KPhotoUpload @"PhotoUpload"
#define kImageName   @"ImageName"
#define KAddName @"addName"
#define kNameUpdate @"NameUpdate"
#define KEnterName @"EnterName"
#define KAction    @"Action"
#define KDownLoadAllImages @"DownLoadAllImages"
#define KImagetype @"thumb"
#define KAllImgDownLoad @"AllImgDownLoad"
#define KPath           @"path"

#define KAllImages @"allImages"
#define KUserStatus @"UserStatus"
#define KUserName @"UserName"
#define KUserNumber  @"UserNumber"

#define KDataDict @"DataDict"
#define KMissedCallService @"MissedCallService"
#define KNoOFCallMissedCall @"NoOFCallMissedCall"
#define kRemoteNumber     @"RemoteNumber"
#define KInviteService @"InviteService"
#define KSendNumber    @"KSendNumber"
#define KStatusUpdate  @"StatusUpdate"
#define KCountryCountryWithCode       @"countryWithCode"
#define KStatusValue    @"StatusValue"
//#define KCustomStatusArr  @"customStatusArr"
#define KCustomStatusArr    @"customStatusArr"
#define KSupport_Number   @"support_Number"
#define KFaqData       @"FaqData"
#define KMobileNumber      @"MobileNumber"
#define kMinCallCredit      @"MinCallCredit"
#define KMatchContacts     @"MatchContacts"
#define KPushNotificationForRoaming4WorldPlus @"PushNotificationForRoaming4WorldPlus"
#define KDeviceToken     @"DeviceToken"
#define KDateAndTime     @"DateAndTime"
#define KLocationSend    @"LocationSend"
#define kRates            @"rate"
#define kSignUpCountryCode          @"SignUpCountryCode"
#define KNumberCheckMbgOrNot  @"KNumberCheckMbgOrNot"
#define KgetRates     @"getRates"
#define Krates       @"rates"
#define kRatesAlreadyLoaded @"ratesLoaded"
#define kRates            @"rate"
#define KRechargeVerification @"RechargeVerification"
#define KverificationUrl @"VerificationUrl"
#define KRechargeResponse @"RechargeResponse"
// Roaming feature
#define kGetDID                   @"getDID"
#define kGetBalanceDetails        @"getDetails"
#define kForwardCalls             @"forwardCalls"
#define kDeactivateSim            @"deactivateSim"
#define kGetCallOnApp             @"callsOnApp"

#define KRecharge     @"Recharge"
#define KRoamingBalanceShow @"RoamingBalanceShow"
#define KMBGTALKSIMCALLCHARGE @"MBGTALKSIMCALLCHARGE"
#define KNewLoginService       @"NewLoginService"
#define KpassWord              @"passWord"
#define KCheckRoamingFeaturesExistsORNot @"CheckRoamingExistsORNot"
#define KMissedCallLoaded  @"MissedCallLoaded"
#define KImageDownLoaded   @"ImageDownLoaded"
#define KMissedCallUpdate   @"MissedCallUpdate"
#define KMissedCallNumber   @"MissedCallNumber"
#define KProfilePicDownLoad  @"ProfilePicDownLoad"
#define KParticularImage    @"ParticularImage"
#define  KStarSelection     @"StarSelection"
#define  KRatingToApp       @"RatingToApp"
#define KAfterRemoveFirstThreeDigit @"AfterRemoveFirstThreeDigit"
#define KSimCallBalance     @"SimCallBalance"
//#define kGetCallDetails
#define KRateDownloaded     @"RateDownloaded"
#define KCurrentMisscallNumber @"MissCallNumber"
#define KNewSignUp      @"NewSignUp"

#define kNewVerify @"NewVerify"

#define KTestPushnotification @"TestPushnotification"




