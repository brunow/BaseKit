//
//  BKSDKAvailability.m
//  BaseKit
//
//  Created by Bruno Wernimont on 31/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BKDeviceAvailability.h"


////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL BKIsPad(void) {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL BKIsMultitaskingSupported(void) {
    return [[UIDevice currentDevice] isMultitaskingSupported];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL BKIsCameraAvailable(void) {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL BKDoesCameraSupportShootingVideos(void) {
    //[UIImagePickerController cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypeCamera];
    return NO;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL BKDoesCameraSupportTakingPhotos(void) {
    //return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
    return NO;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL BKIsFrontCameraAvailable(void) {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL BKIsRearCameraAvailable(void) {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL BKIsFlashAvailableOnFrontCamera(void) {
    return [UIImagePickerController isFlashAvailableForCameraDevice: UIImagePickerControllerCameraDeviceFront];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL BKIsFlashAvailableOnRearCamera(void) {
    return [UIImagePickerController isFlashAvailableForCameraDevice: UIImagePickerControllerCameraDeviceRear];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL BKIsRetinaDisplay(void) {
    return ([UIScreen instancesRespondToSelector:@selector(scale)] &&
            [[UIScreen mainScreen] scale] == 2.0);
}
