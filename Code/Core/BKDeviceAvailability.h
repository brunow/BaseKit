//
//  BKSDKAvailability.h
//  BaseKit
//
//  Created by Bruno Wernimont on 31/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

/*
 * Check if the device is running on ipad or not
 *      @return YES if device is ipad
 */
BOOL BKIsPad(void);

BOOL BKIsMultitaskingSupported(void);

BOOL BKIsCameraAvailable(void);

BOOL BKDoesCameraSupportShootingVideos(void);

BOOL BKDoesCameraSupportTakingPhotos(void);

BOOL BKIsFrontCameraAvailable(void);

BOOL BKIsRearCameraAvailable(void);

BOOL BKIsFlashAvailableOnFrontCamera(void);

BOOL BKIsFlashAvailableOnRearCamera(void);

BOOL BKIsRetinaDisplay(void);