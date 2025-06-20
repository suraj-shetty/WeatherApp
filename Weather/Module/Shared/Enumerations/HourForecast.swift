//
//  HourForcast.swift
//  Weather
//
//  Created by Suraj Shetty on 15/06/25.
//

import Foundation
import WeatherKit

struct HourForecast: Identifiable, Hashable {
    let id: UUID = UUID() //For unique ID
    let time: String
    let temperature: String
    let condition: WeatherCondition
    let symbol: String
}
