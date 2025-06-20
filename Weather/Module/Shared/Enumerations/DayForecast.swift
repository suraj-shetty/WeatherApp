//
//  DayForecast.swift
//  Weather
//
//  Created by Suraj Shetty on 15/06/25.
//

import Foundation
import WeatherKit
struct DayForecast: Identifiable {
    let id: UUID = UUID()
    let temperature: String
    let apparentTemperature: String
    let condition: WeatherCondition
    let symbol: String
    let dateText: String
    let sunsetTime: String
    let suggestionText: String
}
