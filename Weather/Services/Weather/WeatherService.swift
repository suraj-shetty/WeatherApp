//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Suraj Shetty on 12/06/25.
//

import Foundation
import WeatherKit
import CoreLocation

struct WeatherService {
    private let service = WeatherKit.WeatherService.shared
    
    func weather(for location: CLLocation) async throws -> WeatherForecast {
        
        let weather = try await service.weather(for: location)
        let current = weather.currentWeather
        let dailyForcast = weather.dailyForecast.first
        
        let timeFormatter: DateFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh a"
        
        let currentTime = timeFormatter.string(from: Date.now)
        
        var formatter: MeasurementFormatter {
            let formatter = MeasurementFormatter()
            formatter.unitStyle = .medium
            formatter.numberFormatter.maximumFractionDigits = 0
            formatter.unitOptions = .temperatureWithoutUnit
            return formatter
        }
        
        var hourlyForecasts: [HourForecast] = []
        for hour in weather.hourlyForecast {
            let time = timeFormatter.string(from: hour.date)
            let hourForecast: HourForecast = .init(
                time: (time == currentTime) ? "Now" : time,
                temperature: formatter.string(from: hour.temperature),
                condition: hour.condition,
                symbol: hour.symbolName)
            
            hourlyForecasts.append(hourForecast)
        }
        
        let sunsetTime = dailyForcast?.sun.sunset?.formatted(date: .omitted, time: .shortened) ?? ""
                
        let dayForecast = DayForecast(temperature: formatter.string(from: current.temperature),
                                      apparentTemperature: formatter.string(from: current.apparentTemperature),
                                      condition: current.condition,
                                      symbol: current.symbolName,
                                      dateText: current.date.formatted(date: .abbreviated,
                                                                       time: .omitted),
                                      sunsetTime: sunsetTime,
                                      suggestionText: "")
                
        let forecast = WeatherForecast(dayForecast: dayForecast,
                                       hourForecasts: hourlyForecasts)
                
           return forecast
                //        return WeatherData(
                //            date: current.date,
                //            temperature: current.temperature,
                //            feelsLike: current.apparentTemperature,
                //            highTemperature: dailyForcasts?.highTemperature,
                //            lowTemperature: dailyForcasts?.lowTemperature,
                //            condition: current.condition.description,
                //            windSpeed: current.wind.speed,
                //            humidity: current.humidity,
                //            pressure: current.pressure,
                //            dewPoint: current.dewPoint.value
                //        )
    }
    
    //    private func updateUI(with weatherData: WeatherData) {
    //
    //
    ////        self.temperature        = weatherData.formattedTemperature
    ////        self.condition          = weatherData.condition
    ////        self.lowTemperature     = weatherData.formattedLowTemperature
    ////        self.highTemperature    = weatherData.formattedHighTemperature
    ////        self.humidity           = weatherData.formattedHumidity
    //////        self.pressure = weatherData.formattedPressure
    ////        self.windSpeed          = weatherData.formattedWindSpeed
    ////        self.date               = weatherData.date.formatted(date: .abbreviated,
    ////                                                             time: .omitted)
    ////        self.dewPoint           = weatherData.dewPoint
    //    }
}
