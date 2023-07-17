//
//  LocationProvider.swift
//  Weather
//
//  Created by Viktor on 15.07.2023.
//

import Foundation
import CoreLocation

typealias LocationCoordsCompletion = (CLLocation) -> Void

protocol LocationProviderInput {
    func fetchCoords(completion: @escaping LocationCoordsCompletion)
}

class LocationProvider: NSObject, LocationProviderInput {
    private let defaultCity = CLLocation(latitude: 55.751244, longitude: 37.618423)
    private var locationManager = CLLocationManager()
    private var completion: LocationCoordsCompletion?
    
    func fetchCoords(completion: @escaping LocationCoordsCompletion) {
        
        let status = self.locationManager.authorizationStatus
        if status == .denied || status == .restricted {
            completion(defaultCity)
            return
        }
        
        self.locationManager.delegate = self
        self.completion = completion
        if status == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }
        else {
            self.locationManager.requestLocation()
        }
    }
}

extension LocationProvider: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.completion?(location)
        }
        else {
            self.completion?(defaultCity)
        }
        self.completion = nil
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.completion?(defaultCity)
        self.completion = nil
    }
}
