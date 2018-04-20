//
//  LocationManagerMock.swift
//  FourSquaredClone
//
//  Created by Thanathip on 20/4/2561 BE.
//  Copyright © 2561 Thanathip. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManagerMock: LocationManager {
    var delegate: CLLocationManagerDelegate?

    func requestWhenInUseAuthorization() {}

    func requestLocation() {}


}
