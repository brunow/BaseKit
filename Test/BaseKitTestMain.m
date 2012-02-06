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

#import <UIKit/UIKit.h>

// If you are using the framework
#import <GHUnitIOS/GHUnit.h>
// If you are using the static library and importing header files manually
//#import "GHUnit.h"

// Default exception handler
void exceptionHandler(NSException *exception);
void exceptionHandler(NSException *exception) { 
    NSLog(@"%@\n%@", [exception reason], GHUStackTraceFromException(exception));
}

int main(int argc, char *argv[]) {
    /*!
     For debugging:
     Go into the "Get Info" contextual menu of your (test) executable (inside the "Executables" group in the left panel of XCode). 
     Then go in the "Arguments" tab. You can add the following environment variables:
     
     Default:   Set to:
     NSDebugEnabled                        NO       "YES"
     NSZombieEnabled                       NO       "YES"
     NSDeallocateZombies                   NO       "YES"
     NSHangOnUncaughtException             NO       "YES"
     
     NSEnableAutoreleasePool              YES       "NO"
     NSAutoreleaseFreedObjectCheckEnabled  NO       "YES"
     NSAutoreleaseHighWaterMark             0       non-negative integer
     NSAutoreleaseHighWaterResolution       0       non-negative integer
     
     For info on these varaiables see NSDebug.h; http://theshadow.uw.hu/iPhoneSDKdoc/Foundation.framework/NSDebug.h.html
     
     For malloc debugging see: http://developer.apple.com/mac/library/documentation/Performance/Conceptual/ManagingMemory/Articles/MallocDebug.html
     */
    
    NSSetUncaughtExceptionHandler(&exceptionHandler);
    
    // Register any special test case classes
    //[[GHTesting sharedInstance] registerClassName:@"GHSpecialTestCase"];  
    @autoreleasepool {
        int retVal = 0;

        if (getenv("GHUNIT_CLI")) {
            retVal = [GHTestRunner run];
        } else {
            retVal = UIApplicationMain(argc, argv, nil, @"GHUnitIPhoneAppDelegate");
        }
        return retVal;
    }
}
