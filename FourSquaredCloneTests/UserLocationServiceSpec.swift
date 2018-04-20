//
//  UserLocationServiceSpec.swift
//  FourSquaredCloneTests
//
//  Created by Thanathip on 20/4/2561 BE.
//  Copyright © 2561 Thanathip. All rights reserved.
//

import XCTest
import Swinject
import CoreLocation
@testable import FourSquaredClone

class UserLocationServiceSpec: XCTestCase {
    var container: Container!
    private var locationManager: LocationManagerMock!
    private var userLocationService: UserLocationService!

    
    override func setUp() {
        super.setUp()
        container.register(LocationManager.self) { _ in LocationManagerMock() }
            .inObjectScope(.container)
        container.register(UserLocationService.self) { resolver in
            UserLocationService.init(locationManager: resolver.resolve(LocationManager.self)!)
        }

        locationManager = container.resolve(LocationManager.self)! as? LocationManagerMock
        userLocationService = container.resolve(UserLocationService.self)!
    }
    
    func testDependencyDelegateShouldBeWrapperClass() {
        let locationManager = container.resolve(LocationManager.self)!
        let userLocationService: UserLocationService = container.resolve(UserLocationService.self)!
        XCTAssertTrue(locationManager.delegate === userLocationService)
    }

    func testShouldRequestUserPermission() {
        guard let locationManager = container.resolve(LocationManager.self)! as? LocationManagerMock else {
            XCTFail("Error resolving container dependencies")
            return
        }

        let userLocationService = container.resolve(UserLocationService.self)!

        XCTAssertFalse(locationManager.calledRequestWhenInUseAuthorization)
        _ = userLocationService.getUserLocation()
        XCTAssertTrue(locationManager.calledRequestWhenInUseAuthorization)
    }
    
}
