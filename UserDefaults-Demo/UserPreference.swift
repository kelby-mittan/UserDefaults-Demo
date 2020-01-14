//
//  UserPreference.swift
//  UserDefaults-Demo
//
//  Created by Alex Paul on 1/13/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

enum UnitMeasurement: String {
    case miles = "Miles"
    case kilometers = "Kilometers"
}

enum BikeRun: String {
    case bike = "bike"
    case run = "run"
}

struct UserPreferenceKey {
    static let unitMeasurement = "Unit Measurement"
    static let bikeRunImage = "Bike or Run"
}

class UserPreference {
    
    // a Singleton's initializer NEEDS to be private - this ensures that
    // ONLY one instance of this class is used throughout the application
    private init() {}
    
    static let shared = UserPreference()
    
    // set a user defaults value (object)
    func updateUnitMeasurement(with unit: UnitMeasurement) {
        // storing or persiting the unit measurment value to UserDefaults (device or simimular as permanent storage)
        
        // UserDefaults.standard is a Singleton in iOS that gives us access to
        // saving and retrieving stored data in the device or simulator
        UserDefaults.standard.set(unit.rawValue, forKey: UserPreferenceKey.unitMeasurement)
        
        // key is "Unit Measurement"
        // value is either "Miles" or "Kilometers"
        // UserDefaults: ["Unit Measurement" : "Kilometers"]
    }
    
    func updateImage(with image: BikeRun) {
        UserDefaults.standard.set(image.rawValue, forKey: UserPreferenceKey.bikeRunImage)
    }
    
    // retrieve a user defaults value (object)
    func getUnitMeasurement() -> UnitMeasurement? {
        guard let unitMeasurement = UserDefaults.standard.object(forKey: UserPreferenceKey.unitMeasurement) as? String else {
            return nil
        }
        return UnitMeasurement(rawValue: unitMeasurement)
    }
    
    func getImageString() -> BikeRun? {
        guard let bikeOrRun = UserDefaults.standard.object(forKey: UserPreferenceKey.bikeRunImage) as? String else {
            return nil
        }
        return BikeRun(rawValue: bikeOrRun)
    }
}
