//
//  Constants.h
//  DemoMircosoftFaceAPI
//
//  Created by Winson Mac on 10/19/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//


/* ---------------------------------------------------------------- */
/*  Register face detection service on Azure Microsolf Server       */
/* ---------------------------------------------------------------- */
#define SUBSCRIPTION_KEY                    @"2991f765e5cd4f15b031d00e9adea724"


/* ---------------------------------------------------------------- */
/*  Microsolf face api services                                     */
/* ---------------------------------------------------------------- */
#define API_DETECT_FACE                     @"https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect?returnFaceId=%@&returnFaceLandmarks=%@&returnFaceAttributes=%@"
#define API_PARAM_RETURN_FACE_ID            @"returnFaceId"
#define API_PARAM_RETURN_FACE_LANDMARKS     @"returnFaceLandmarks"
#define API_PARAM_RETURN_FACE_ATTRIBUTES    @"returnFaceAttributes"


/* ---------------------------------------------------------------- */
/*  Request methods                                                 */
/* ---------------------------------------------------------------- */
#define POST                                @"POST"
#define GET                                 @"GET"


/* ---------------------------------------------------------------- */
/*  Key for requests, responses                                     */
/* ---------------------------------------------------------------- */
#define KEY_AGE                             @"age"
#define KEY_GENDER                          @"gender"
#define KEY_SMILE                           @"smile"
#define KEY_GLASSES                         @"glasses"
#define KEY_FACIAL_HAIR                     @"facialHair"
#define KEY_EMOTION                         @"emotion"
#define KEY_HEAD_POSE                       @"headPose"
#define KEY_ACCESSORIES                     @"accessories"
#define KEY_BLUR                            @"blur"
#define KEY_EXPOSURE                        @"exposure"
#define KEY_HAIR                            @"hair"
#define KEY_MAKE_UP                         @"makeup"
#define KEY_NOISE                           @"noise"
#define KEY_OCCLUSION                       @"occlusion"
#define KEY_IMAGE_DATA                      @"imageData"
#define KEY_FACE_ID                         @"faceId"
#define KEY_FACE_RECTANGLE                  @"faceRectangle"
#define KEY_TOP                             @"top"
#define KEY_LEFT                            @"left"
#define KEY_WIDTH                           @"width"
#define KEY_HEIGHT                          @"height"
#define KEY_FACE_LANDMARKS                  @"faceLandmarks"
#define KEY_PUPI_LEFT                       @"pupilLeft"
#define KEY_PUPI_RIGHT                      @"pupilRight"
#define KEY_NOSE_TIP                        @"noseTip"
#define KEY_MOUTH_LEFT                      @"mouthLeft"
#define KEY_MOUTH_RIGHT                     @"mouthRight"
#define KEY_EYEBROW_LEFT_OUTER              @"eyebrowLeftOuter"
#define KEY_EYEBROW_LEFT_INNER              @"eyebrowLeftInner"
#define KEY_EYE_LEFT_OUTER                  @"eyeLeftOuter"
#define KEY_EYE_LEFT_TOP                    @"eyeLeftTop"
#define KEY_EYE_LEFT_BOTTOM                 @"eyeLeftBottom"
#define KEY_EYE_LEFT_INNER                  @"eyeLeftInner"
#define KEY_EYEBROW_RIGHT_OUTER             @"eyebrowRightOuter"
#define KEY_EYEBROW_RIGHT_INNER             @"eyebrowRightInner"
#define KEY_EYE_RIGHT_OUTER                 @"eyeRightOuter"
#define KEY_EYE_RIGHT_TOP                   @"eyeRightTop"
#define KEY_EYE_RIGHT_BOTTOM                @"eyeRightBottom"
#define KEY_EYE_RIGHT_INNER                 @"eyeRightInner"
#define KEY_NOSE_ROOT_LEFT                  @"noseRootLeft"
#define KEY_NOSE_ROOT_RIGHT                 @"noseRootRight"
#define KEY_NOSE_LEFT_ALAR_TOP              @"noseLeftAlarTop"
#define KEY_NOSE_RIGHT_ALAR_TOP             @"noseRightAlarTop"
#define KEY_NOSE_LEFT_ALAR_OUTTIP           @"noseLeftAlarOutTip"
#define KEY_NOSE_RIGHT_ALAR_OUTTIP          @"noseRightAlarOutTip"
#define KEY_UPPER_LIP_TOP                   @"upperLipTop"
#define KEY_UPPER_LIP_BOTTOM                @"upperLipBottom"
#define KEY_UNDER_LIP_TOP                   @"underLipTop"
#define KEY_UNDER_LIP_BOTTOM                @"underLipBottom"
#define KEY_X                               @"x"
#define KEY_Y                               @"y"
#define KEY_FACE_ATTRIBUTES                 @"faceAttributes"
#define KEY_SMILE                           @"smile"
#define KEY_HEAD_POSE                       @"headPose"
#define KEY_PITCH                           @"pitch"
#define KEY_ROLL                            @"roll"
#define KEY_YAW                             @"yaw"
#define KEY_FACIAL_HAIR                     @"facialHair"
#define KEY_MOUSTACHE                       @"moustache"
#define KEY_BEARD                           @"beard"
#define KEY_SIDE_BURNS                      @"sideburns"
#define KEY_GLASSES                         @"glasses"
#define KEY_EMOTION                         @"emotion"
#define KEY_ANGER                           @"anger"
#define KEY_CONTEMPT                        @"contempt"
#define KEY_DISGUST                         @"disgust"
#define KEY_FEAR                            @"fear"
#define KEY_HAPPINESS                       @"happiness"
#define KEY_NEUTRAL                         @"neutral"
#define KEY_SADNESS                         @"sadness"
#define KEY_SURPRISE                        @"surprise"
#define KEY_VALUE                           @"value"
#define KEY_BLUR                            @"blur"
#define KEY_BLUR_LEVEL                      @"blurLevel"
#define KEY_EXPOSURE                        @"exposure"
#define KEY_EXPOSURE_LEVEL                  @"exposureLevel"
#define KEY_NOISE                           @"noise"
#define KEY_NOISE_LEVEL                     @"noiseLevel"
#define KEY_MAKE_UP                         @"makeup"
#define KEY_EYE_MAKE_UP                     @"eyeMakeup"
#define KEY_LIP_MAKE_UP                     @"lipMakeup"
#define KEY_ACCESSORIES                     @"accessories"
#define KEY_OCCLUSION                       @"occlusion"
#define KEY_FOREHEAD_OCCLUDED               @"foreheadOccluded"
#define KEY_EYE_OCCLUDED                    @"eyeOccluded"
#define KEY_MOUTH_OCCLUDED                  @"mouthOccluded"
#define KEY_HAIR                            @"hair"
#define KEY_BALD                            @"bald"
#define KEY_INVISIBLE                       @"invisible"
#define KEY_HAIR_COLOR                      @"hairColor"
#define KEY_COLOR                           @"color"
#define KEY_CONFIDENCE                      @"confidence"
#define KEY_TYPE                            @"type"


/* ---------------------------------------------------------------- */
/*  Header key                                                      */
/* ---------------------------------------------------------------- */
#define SUBSCRIPTION_KEY_HEADER             @"ocp-apim-subscription-key"
#define CONTENT_TYPE_HEADER                 @"Content-Type"


/* ---------------------------------------------------------------- */
/*  Header value                                                    */
/* ---------------------------------------------------------------- */
#define CONTENT_TYPE_OCTET_STREAM           @"application/octet-stream"
#define CONTENT_TYPE_JSON                   @"application/json"


/* ---------------------------------------------------------------- */
/*  Request type                                                    */
/* ---------------------------------------------------------------- */
#define REQUEST_TYPE_RAW_DATA               0x002
#define REQUEST_TYPE_FORM_DATA              0x003
#define REQUEST_TYPE_STREAM_DATA            0x004


/* ---------------------------------------------------------------- */
/*  Error code                                                      */
/* ---------------------------------------------------------------- */
#define CODE_NETWORK_ERROR                  1001
#define CODE_NO_NETWORK                     1000
#define CODE_NETWORK_SUCCESS                200
#define CODE_PARAMETER_WRONG                -1


/* ---------------------------------------------------------------- */
/*  Error message                                                   */
/* ---------------------------------------------------------------- */
#define ERROR_NO_NETWORK                    NSLocalizedString(@"ERROR_NO_NETWORK", nil)
#define ERROR_SERVER_ERROR                  NSLocalizedString(@"ERROR_SERVER_ERROR", nil)
#define ERROR_PARAMETER                     NSLocalizedString(@"ERROR_SERVER_ERROR", nil)
#define ERROR_PARSE_DATA                    NSLocalizedString(@"ERROR_SERVER_ERROR", nil)


/* ---------------------------------------------------------------- */
/*  Alert dialog button title                                       */
/* ---------------------------------------------------------------- */
#define ALERT_OK_BUTTON_TITLE               NSLocalizedString(@"ALERT_OK_BUTTON_TITLE", nil)
#define ALERT_ERROR_TITLE                   NSLocalizedString(@"ALERT_ERROR_TITLE", nil)


/* ---------------------------------------------------------------- */
/*  Create size shortcut                                            */
/* ---------------------------------------------------------------- */
#define SCREEN_WIDTH                        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT                       [UIScreen mainScreen].bounds.size.height
#define SCREEN_BOUNDS                       [UIScreen mainScreen].bounds
#define MARGIN                              15
#define BLUR_VIEW_DEFAULT_HEIGHT            180
#define CROPPED_IMAGE_SIZE                  100
#define TOOLBAR_HEIGHT                      ([UIApplication sharedApplication].statusBarFrame.size.height + (self.navigationController.navigationBar.frame.size.height ?: 0.0))


/* ---------------------------------------------------------------- */
/*  Colors shortcut                                                 */
/* ---------------------------------------------------------------- */
#define LIGHT_GRAY_COLOR                    [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1]


/* ---------------------------------------------------------------- */
/*  Content manager shortcut                                        */
/* ---------------------------------------------------------------- */
#define CONTENT_MANAGER                     [ContentManager shareManager]
#define CHECK_NULL_RESULT(A,B)              (![A isEqual:[NSNull null]]?A:B)
#define STRING_FROM_BOOL(VALUE)             VALUE ? @"Yes" : @"No"
#define TYPE_BLUR                           1
#define TYPE_NOISE                          2
#define TYPE_EXPOSURE                       3
