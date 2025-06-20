//
//  WeatherForecast.swift
//  Weather
//
//  Created by Suraj Shetty on 15/06/25.
//

import Foundation
struct WeatherForecast: Identifiable, Equatable {
    let id = UUID()
    let dayForecast: DayForecast
    let hourForecasts: [HourForecast]
    
    static func == (lhs: WeatherForecast, rhs: WeatherForecast) -> Bool {
        return lhs.id == rhs.id
    }
}
