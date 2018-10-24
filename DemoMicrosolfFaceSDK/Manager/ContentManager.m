//
//  ContentManager.m
//  DemoMircosoftFaceAPI
//
//  Created by Winson Mac on 10/19/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "ContentManager.h"

@implementation ContentManager

/* ---------------------------------------------------------------- */
/*  Init content manager                                            */
/* ---------------------------------------------------------------- */
+ (ContentManager *)shareManager {
    static ContentManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager =  [[ContentManager alloc]init];
    });
    return manager;
}

#pragma mark - API list

/* ---------------------------------------------------------------- */
/*  API detect face of microsolf azure                              */
/* ---------------------------------------------------------------- */
- (void)detectFace:(UIImage *)imageNeedDetect showLoading:(BOOL)show completion:(void(^)(BOOL success, NSDictionary *dict ,NSString *errorMessage))callBack {
    NSString *urlString = [NSString stringWithFormat:API_DETECT_FACE,
                           @"true",
                           @"true",
                       @"age,gender,smile,glasses,facialHair,emotion,headPose,accessories,blur,exposure,hair,makeup,noise,occlusion"];
    
    [self sendBaseRequestWithUrl:urlString parameters:@{KEY_IMAGE_DATA: imageNeedDetect} showHud:YES requestType:REQUEST_TYPE_STREAM_DATA httpMethod:POST completion:^(BOOL success, int serverStatus, NSDictionary *dict, NSString *errorMessage) {
        if(success)
        {
            callBack(YES,dict,nil);
        }
        else
        {
            callBack(NO,nil,errorMessage);
        }
    }];
}

#pragma mark - Send base request

/**
 Send a request to server.
 
 @param urlString Request url string.
 @param parmam Dictionary of the params for request.
 @param requestType Type of request such as: Json raw data,...
 @param method Request method.
 @param callBack Callback function for proceeding.
 */
- (void)sendBaseRequestWithUrl:(NSString *)urlString parameters:(NSDictionary *)parmam showHud:(BOOL)isShow requestType:(int)requestType httpMethod:(NSString *)method completion:(void(^)(BOOL success,int serverStatus,NSDictionary *dict,NSString *errorMessage))callBack
{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable)
    {
        callBack(NO,CODE_NO_NETWORK,nil,ERROR_NO_NETWORK);
    }
    else
    {
        [self setNetworkActivityIndicatorVisible:YES];
        
        if(isShow)
        {
            [self setLoaderVisible:YES];
        }
        
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
        
        NSURLRequest *request=[self createRequest:urlString parameters:parmam requestType:requestType HTTPMethod:method];
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
            NSHTTPURLResponse *httpResponse=(NSHTTPURLResponse *)response;
            
            NSDictionary *json;
            BOOL status;
            int serverCode;
            NSString *errorMessage;
            
            NSLog(@"server code: %ld",[httpResponse statusCode]);
            
            if([httpResponse statusCode]==200)
            {
                NSError* error;
                json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                
                NSString *testString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                
                if(error==nil)
                {
                    status=YES;
                    serverCode=CODE_NETWORK_SUCCESS;
                    errorMessage=nil;
                    
                }
                else
                {
                    status=NO;
                    serverCode=CODE_NETWORK_ERROR;
                    errorMessage=ERROR_PARSE_DATA;
                }
            }
            else
            {
                status=NO;
                serverCode=CODE_NETWORK_ERROR;
                errorMessage=ERROR_SERVER_ERROR;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(status,serverCode,json,errorMessage);
                
                [self setNetworkActivityIndicatorVisible:NO];
                if(isShow)
                {
                    [self setLoaderVisible:NO];
                }
            });
            
        }];
        
        [postDataTask resume];
    }
}

- (NSURLRequest*)createRequest:(NSString*)baseRequest parameters:(NSDictionary*)params requestType:(int)requestType HTTPMethod:(NSString*)httpMethod
{
    // Encode & create request
    NSURL *url = [[NSURL alloc] initWithString:baseRequest];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL:url];
    [req setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [req setTimeoutInterval:30.0];
    [req setHTTPMethod:httpMethod];
    
    switch (requestType) {
        case REQUEST_TYPE_RAW_DATA: {
            [req setValue:CONTENT_TYPE_JSON forHTTPHeaderField: CONTENT_TYPE_HEADER];
            if(params!= nil){
                NSData *sendData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
                
                NSString *testString = [[NSString alloc]initWithData:sendData encoding:NSUTF8StringEncoding];
                NSLog(@"%@", testString);
                [req setHTTPBody:sendData];
            }
            break;
        }
        case REQUEST_TYPE_FORM_DATA: {
            //Add content-type to Header. Need to use a string boundary for data uploading.
            NSString *boundary = @"0xKhTmLbOuNdArY";
            // set Content-Type in HTTP header
            [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
            
            // make a buffer for the post body
            NSMutableData *body = [NSMutableData data];
            
            // add params (all params are strings)
            for(int i=0; i<[[params allKeys] count]; i++) {
                NSString *key = [[params allKeys] objectAtIndex:i];
                id param = [params objectForKey:key];
                if([param isKindOfClass:[NSArray class]]){
                    for(id obj in (NSArray *)param){
                        if([obj isKindOfClass:[UIImage class]]){
                            // add image data
                            NSData *imageData = UIImageJPEGRepresentation((UIImage *)obj, 1.0);
                            if (imageData) {
                                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@[]\"; filename=\"image.jpg\"\r\n", key] dataUsingEncoding:NSUTF8StringEncoding]];
                                [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                                [body appendData:imageData];
                                [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
                            }
                            [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                        } else {
                            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", key] dataUsingEncoding:NSUTF8StringEncoding]];
                            [body appendData:[[NSString stringWithFormat:@"%@\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
                        }
                    }
                }
                else if([param isKindOfClass:[UIImage class]]){
                    // add image data
                    NSData *imageData = UIImageJPEGRepresentation((UIImage *)param, 1.0);
                    if (imageData) {
                        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", key] dataUsingEncoding:NSUTF8StringEncoding]];
                        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                        [body appendData:imageData];
                        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
                    }
                    
                    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                } else {
                    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", key] dataUsingEncoding:NSUTF8StringEncoding]];
                    [body appendData:[[NSString stringWithFormat:@"%@\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
                }
            }
            NSString *bodyString =[[NSString alloc] initWithData:body encoding:NSASCIIStringEncoding];
            NSLog(@"%@", bodyString);
            
            [req setHTTPBody:body];
            break;
        }
        case REQUEST_TYPE_STREAM_DATA: {
            [req setValue:CONTENT_TYPE_OCTET_STREAM forHTTPHeaderField: CONTENT_TYPE_HEADER];
            [req setValue:SUBSCRIPTION_KEY forHTTPHeaderField:SUBSCRIPTION_KEY_HEADER];
            NSData *data = UIImageJPEGRepresentation([params objectForKey:KEY_IMAGE_DATA], 0.8);
            NSString *bodyString =[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"%@", bodyString);
            
            [req setHTTPBody:data];
            break;
        }
        default:
            break;
    }
    
    return req;
}

#pragma mark - networks status showing

/**
 *  Use to show/hide default load on status bar of device
 *
 *  @param setVisible Show value
 */
- (void)setNetworkActivityIndicatorVisible:(BOOL)setVisible
{
    /**
     *  Declare a static variable to handle show/hide loader
     */
    static int numberOfCallsToSetVisible = 0;
    
    /**
     *  Check if parent want to show default loader
     */
    if (setVisible)
    {
        /**
         *  Increase numberOfCallsToSetVisible with value = 1
         */
        numberOfCallsToSetVisible++;
    }
    else
    {
        /**
         *  Decrease numberOfCallsToSetVisible with value = 1
         */
        numberOfCallsToSetVisible--;
    }
    
    /**
     *  Set default loader on status bar hide/show depends on numberOfCallsToSetVisible value
     */
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:(numberOfCallsToSetVisible > 0)];
}

#pragma mark - Show/hide loader in status bar when download data

/**
 *  Use to show hud loader
 */
-(void)showHUD
{
    /**
     *  Check if not any hud available yet
     */
    if (!hud)
    {
        /**
         *  Create a new hud view
         */
        hud = [[JKProgressHUD alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    }
    
    /**
     *  Show hud
     */
    [hud show];
}

/**
 *  Use to hide hud loader
 */
-(void)hideHUD
{
    /**
     *  Hide hud
     */
    [hud hide];
}

/**
 *  Set hud view status (hide/Show
 *
 *  @param setVisible Show value
 */
- (void)setLoaderVisible:(BOOL)setVisible
{
    /**
     *  Declare a static variable to handle show/hide hud
     */
    static int numberLoader = 0;
    
    /**
     *  Check if parent want to show hud
     */
    if (setVisible)
    {
        /**
         *  Increase numberLoader with value = 1
         */
        numberLoader++;
    }
    else
    {
        /**
         *  Decrease numberLoader with value = 1
         */
        numberLoader--;
    }
    
    /**
     *  Check numberLoader value status
     */
    if(numberLoader>0)
    {
        /**
         *  Show hud on UI thread
         */
        [self showHUD];
    }
    else
    {
        /**
         *  Hide Hud
         */
        [self hideHUD];
    }
}

#pragma mark - Show alert error

/**
 An util helps displaying an error message.
 
 @param errorMessage The content message.
 @param controller The controller for displaying.
 */
- (void)showAlertErrorWithMessage:(NSString *)errorMessage fromController:(UIViewController *)controller
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:ALERT_ERROR_TITLE
                                          message:errorMessage
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:ALERT_OK_BUTTON_TITLE
                               style:UIAlertActionStyleDefault
                               handler:nil];
    
    [alertController addAction:okAction];
    
    [controller presentViewController:alertController animated:YES completion:nil];
}


/**
 An until helps reverse string

 @param string originString
 @return reversedString
 */
- (NSString*)reverseString:(NSString *)string {
    
    string = [NSString stringWithFormat:@"%@",string];
    NSMutableString *endString = [NSMutableString new];
    
    while ([string length]!=[endString length]) {
        NSRange range = NSMakeRange([string length]-[endString length]-1, 1);
        [endString appendString: [string substringWithRange:range]];
    }
    return endString;
}

@end
