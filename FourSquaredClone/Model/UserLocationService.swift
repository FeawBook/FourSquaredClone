//
//  UserLocationService.swift
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
        self.locationManager.delegate = self
    }

    func getUserLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

extension UserLocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


