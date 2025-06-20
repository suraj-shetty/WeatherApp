//
//  WeatherTileViewModel.swift
//  Weather
//
//  Created by Suraj Shetty on 13/06/25.
//

import Foundation

@Observable
class WeatherTileViewModel: ObservableObject {
    var title: String = "12AM"
    var temperature: String = "25°"
}
