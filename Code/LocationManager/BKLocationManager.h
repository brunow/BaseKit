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

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>
#import "BKMacrosDefinitions.h"

typedef void (^BKLocationManagerDidUpdateLocation)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation);
typedef void (^BKLocationManagerDidFail)(CLLocationManager *manager, NSError *error);

@interface BKLocationManager : NSObject <CLLocationManagerDelegate> {
    BKLocationManagerDidUpdateLocation _didUpdateLocationBlock;
    BKLocationManagerDidFail _didFailBlock;
}

@property (nonatomic, strong) CLLocationManager *locationManager;
@property(nonatomic, assign) CLLocationAccuracy desiredAccuracy;

+ (id)sharedManager;

- (void)startUpdatingLocationWithAccuracy:(CLLocationAccuracy)accurary;

- (void)startUpdatingLocation;

- (void)stopUpdatingLocation;

- (void)setDidUpdateLocationBlock:(BKLocationManagerDidUpdateLocation)block;

- (void)setDidFailBlock:(BKLocationManagerDidFail)block;

@end
