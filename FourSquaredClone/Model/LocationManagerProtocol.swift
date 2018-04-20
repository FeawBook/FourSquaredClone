//
//  LocationManagerProtocol.swift
//  FourSquaredClone
//
//  Created by Thanathip on 20/4/2561 BE.
//  Copyright © 2561 Thanathip. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManager {
    var delegate: CLLocationManagerDelegate? { get set }
    func requestWhenInUseAuthorization()
    func requestLocation()
}

extension CLLocationManager: LocationManager {}
