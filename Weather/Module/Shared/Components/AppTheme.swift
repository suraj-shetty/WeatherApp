//
//  AppTheme.swift
//  Weather
//
//  Created by Suraj Shetty on 15/06/25.
//

import SwiftUI

struct Theme {
    let primaryTextColor: Color
    let secondaryTextColor: Color
    let tileColor: Color
    let tileGradient: RadialGradient
    let backgroundImage: String
    
    static let cloudy: Theme = .init(
        primaryTextColor: .init(hex: "#CAD7DF"),
        secondaryTextColor: .white,
        tileColor: .init(hex: "#91B4C6"),
        tileGradient: RadialGradient(
            gradient: Gradient(stops: [
                .init(color: Color(red: 145/255, green: 180/255, blue: 198/255).opacity(0.525), location: 0.0),
                .init(color: Color(red: 145/255, green: 180/255, blue: 198/255).opacity(0.225), location: 1.0)
            ]),
            center: UnitPoint(x: 0.009, y: 0.0298),
            startRadius: 0,
            endRadius: 500 // Adjust based on your view size
        ),
        backgroundImage: "cloudy"
    )
    
    static let sunny: Theme = .init(
        primaryTextColor: .init(hex: "#EFAA82"),
        secondaryTextColor: .white,
        tileColor: .init(hex: "#FAE2BD"),
        tileGradient: RadialGradient(
            gradient: Gradient(colors: [
                Color(red: 250/255, green: 226/255, blue: 189/255, opacity: 0.525),
                Color(red: 250/255, green: 226/255, blue: 189/255, opacity: 0.225)
            ]),
            center: .init(x: 0.009, y: 0.0298), // 0.9% and 2.98% normalized
            startRadius: 0,
            endRadius: 400 // adjust based on your layout needs
        ),
        backgroundImage: "sunny"
    )
    
    static let rainy: Theme = .init(
        primaryTextColor: .init(hex: "#C9E8E0"),
        secondaryTextColor: .white,
        tileColor: .init(hex: "#40666A"),
        tileGradient: RadialGradient(
            gradient: Gradient(colors: [
                Color(red: 64/255, green: 102/255, blue: 106/255, opacity: 0.525),
                Color(red: 64/255, green: 102/255, blue: 106/255, opacity: 0.225)
            ]),
            center: .init(x: 0.009, y: 0.0298), // 0.9% and 2.98%
            startRadius: 0,
            endRadius: 400 // Adjust as needed
        ),
        backgroundImage: "rainy"
    )
    
    static let snowy: Theme = .init(
        primaryTextColor: .init(hex: "#E4F1F9"),
        secondaryTextColor: .white,
        tileColor: .init(hex: "#99B8CC"),
        tileGradient: RadialGradient(
            gradient: Gradient(colors: [
                Color(red: 153/255, green: 184/255, blue: 204/255, opacity: 0.525),
                Color(red: 153/255, green: 184/255, blue: 204/255, opacity: 0.225)
            ]),
            center: .init(x: 0.009, y: 0.0298), // 0.9% and 2.98%
            startRadius: 0,
            endRadius: 400 // You can tweak this based on view size
        ),
        backgroundImage: "snowy"
    )
    
}


