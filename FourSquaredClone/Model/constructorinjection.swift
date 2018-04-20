//
//  constructorinjection.swift
//  FourSquaredClone
//
//  Created by Thanathip on 20/4/2561 BE.
//  Copyright © 2561 Thanathip. All rights reserved.
//

import Foundation
import CoreLocation



class UserLocationService: NSObject {
    fileprivate var locationManager: CLLocationManager

    init(locationManager: CLLocationManager) {
        self.locationManager = locationManager
        super.init()
    }
}
