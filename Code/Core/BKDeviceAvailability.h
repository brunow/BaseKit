//
// Created by Bruno Wernimont on 2012
// Copyright 2012 BaseKit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

/**
 Check if the device is running on ipad or not
 @return YES if device is ipad
 */
BOOL BKIsPad(void);

/**
 A boolean value indicating whether multitasking is supported.
 @return boolean value
 */
BOOL BKIsMultitaskingSupported(void);

/**
 A boolean value indicating whether camera is available
 @return boolean value
 */
BOOL BKIsCameraAvailable(void);

/**
 A boolean value indicating whether front camera is available
 @return boolean value
 */
BOOL BKIsFrontCameraAvailable(void);

/**
 A boolean value indicating whether rear camera is available
 @return boolean value
 */
BOOL BKIsRearCameraAvailable(void);

/**
 A boolean value indicating whether front flash is available.
 @return boolean value
 */
BOOL BKIsFlashAvailableOnFrontCamera(void);

/**
 A boolean value indicating whether current screen is retina display.
 @return boolean value
 */
BOOL BKIsFlashAvailableOnRearCamera(void);

/**
 A boolean value indicating whether current screen is retina display.
 @return boolean value
 */
BOOL BKIsRetinaDisplay(void);