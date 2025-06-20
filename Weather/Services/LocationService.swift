//
//  LocationService.swift
//  WeatherApp
//
//  Created by Suraj Shetty on 12/06/25.
//

import Foundation
import CoreLocation


final class LocationService:NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    
    @Published var location: CLLocation?
//    @Published var speed: Double = 0.0

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func fetchLocation() {
        manager.startUpdatingLocation()
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latest = locations.last else { return }
        location = latest
        manager.stopUpdatingLocation()
//        speed = max(latest.speed, 0)
    }
}
