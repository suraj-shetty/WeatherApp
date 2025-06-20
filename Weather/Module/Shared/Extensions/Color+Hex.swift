//
//  Color+Hex.swift
//  WeatherApp
//
//  Created by Suraj Shetty on 11/06/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b, a: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (r, g, b, a) = ((int >> 16) & 0xff, (int >> 8) & 0xff, int & 0xff, 255)
        case 8: // RGBA (32-bit)
            (r, g, b, a) = ((int >> 24) & 0xff, (int >> 16) & 0xff, (int >> 8) & 0xff, int & 0xff)
        default:
            (r, g, b, a) = (255, 0, 0, 255) // default red for invalid
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Color {
    static let weatherText: Color = .init(hex: "#EBEBF5").opacity(0.6)
    static let text: Color  = .init(hex: "#313341")
    static let subText: Color   = .init(hex: "#9A938C")
    static let temperatureText: Color  = .init(hex: "#303345")    
}
