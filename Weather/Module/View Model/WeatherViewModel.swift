//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Suraj Shetty on 11/06/25.
//

import Foundation
import Combine
import CoreLocation

@Observable
class WeatherViewModel: @unchecked Sendable {
    var forecast: WeatherForecast?
    var locationName: String = ""
    
    private let locationService = LocationService()
    private let weatherService = WeatherService()
    
    @ObservationIgnored
    private var cancellables = Set<AnyCancellable>()
    
    init () {
        locationService.$location
            .removeDuplicates()
            .receive(on: RunLoop.main)
            .sink { completion in
                
            } receiveValue: {[weak self] output in
                if let location = output {
                    
                    Task.init {
                        self?.fetchCityName(for: location)
                        await self?.fetchWeather(for: location)
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach{ $0.cancel()}
    }
    
    func pullWeatherData() {
        locationService.fetchLocation()
    }
    
    private func logCurrentQueue(_ context: String = "") {
        let label = String(cString: __dispatch_queue_get_label(nil))
        let thread = Thread.isMainThread ? "🟢 Main" : "🔴 Background"
        print("[\(thread)] \(label) \(context)")
    }
    
    private func fetchWeather(for location: CLLocation) async {
        //        if Thread.isMainThread {
        //            print("Fetch Weather running on the main queue")
        //        } else {
        //            print("Fetch Weather running on a background queue")
        //        }
        logCurrentQueue("Fetch weather")
        do {
            let weatherData = try await weatherService.weather(for: location)
            self.forecast = weatherData
        }
        catch {
            print("Failed to fetch weather")
            print(error)
        }
    }
    
    private func fetchCityName(for location: CLLocation) {
        logCurrentQueue("Fetch City name outer")
        
        Task.init {[weak self] in
            self?.logCurrentQueue("Fetch weather inside Task.init")
            
            guard let ref = self else { return }
            let geocoder = CLGeocoder()
            let placemark: CLPlacemark? = try? await geocoder.reverseGeocodeLocation(location).first
            
            let city = placemark?.locality ?? ""
            let country = placemark?.country ?? ""
            
            DispatchQueue.main.async {[weak ref] in
                ref?.locationName = "\(city), \(country)"
            }
        }
        //
        //        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
        //            if let firstPlacemark = placemarks?.first {
        //                self?.city = firstPlacemark.locality ?? ""
        //                self?.country = firstPlacemark.country ?? ""
        //            } else {
        //
        //            }
        //        }
    }
}
