//
//  WeatherView.swift
//  Weather
//
//  Created by Suraj Shetty on 12/06/25.
//

import SwiftUI

struct WeatherView: View {
    @State var viewModel = WeatherViewModel()
    @State var theme: Theme = .sunny
    //    var scene: SKScene {
    //        let scene = WeatherScene()
    //        scene.size = UIScreen.main.bounds.size
    //        scene.scaleMode = .resizeFill
    //        return scene
    //    }
    
    var body: some View {
        
        VStack {
            
            if let forecast = viewModel.forecast {
                dayForecastView(forecast: forecast.dayForecast)
                //                    .frame(width: .infinity)
                    .padding(.bottom, 35)
                    .padding(.horizontal, 34)
                
                hourForecasts(forecast: forecast.hourForecasts)
                
                Spacer()
            }
            else {
                
            }
            //
            //                Color.clear
            //                    .frame(height: 23)
            //
            //
            //                Image(.house)
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fit)
            
            Spacer()
        }
        .background(
            Image(theme.backgroundImage)
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
        //        .background(
        //            WeatherBackgroundView(dewPoint: viewModel.dewPoint)
        //                .ignoresSafeArea()
        //        )
        //        .ignoresSafeArea()
        .onAppear {
            viewModel.pullWeatherData()
        }
        .onChange(of: viewModel.forecast) { _, newValue in
            guard let value = newValue else { return }
            
            switch value.dayForecast.condition {
            case .blizzard, .blowingSnow, .flurries, .frigid, .hail, .haze, .heavySnow, .snow, .sunFlurries:
                self.theme = .snowy
                
            case .blowingDust, .breezy, .clear, .hot, .mostlyClear, .windy:
                self.theme = .sunny
                            
            case .cloudy, .partlyCloudy, .smoky, .sleet, .wintryMix:
                self.theme = .cloudy
                
            case .drizzle, .foggy, .freezingDrizzle, .freezingRain, .heavyRain, .hurricane, .isolatedThunderstorms, .rain, .scatteredThunderstorms, .strongStorms, .sunShowers, .thunderstorms, .tropicalStorm, .mostlyCloudy:
                self.theme = .rainy
                
            @unknown default:
                self.theme = .sunny
            }
        }
        //        SpriteView(scene: scene)
        //            .ignoresSafeArea()
    }
    
    
    @ViewBuilder
    private func dayForecastView(forecast: DayForecast) -> some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Today")
                .font(.system(size: 25, weight: .medium))
            //                    .frame(height: 38)
                .padding(.bottom, 5)
            
            HStack(alignment: .firstTextBaseline,
                   spacing: 20) {
                Image(systemName: forecast.symbol)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 72, height: 72)
                
                Text(forecast.temperature)
                    .font(.system(size: 100, weight: .medium))
                    .frame(height: 150)
            }
            //                       .padding(.bottom, 15)
            
            Text(forecast.condition.description)
                .font(.system(size: 20, weight: .semibold))
                .frame(height: 30)
            
            Text(viewModel.locationName)
                .font(.system(size: 15, weight: .medium))
                .frame(height: 24)
                .padding(.vertical, 15)
            
            Text(forecast.dateText)
                .font(.system(size: 15, weight: .medium))
                .frame(height: 24)
                .padding(.bottom, 15)
            
            HStack(alignment: .center, spacing: 10) {
                Text("Feels like \(forecast.apparentTemperature)")
                
                Divider()
                    .frame(width: 1, height: 10)
                
                Text("Sunset \(forecast.sunsetTime)")
            }
            .font(.system(size: 15, weight: .medium))
            .frame(height: 24)
            
        }
        .foregroundStyle(theme.primaryTextColor)
        .padding(.init(top: 25,
                       leading: 0,
                       bottom: 34,
                       trailing: 0))
        .frame(maxWidth: .infinity)
        .background(
            theme.tileColor
                .cornerRadius(35)
        )
    }
    
    @ViewBuilder
    private func hourForecasts(forecast: [HourForecast]) -> some View {
        let columns = 5
        let items = forecast.prefix(10)
        
        // Break items into rows of `columns` count
        var rows: [[HourForecast]] {
            stride(from: 0, to: items.count, by: columns).map {
                Array(items[$0..<min($0 + columns, items.count)])
            }
        }
        
        VStack(spacing: 0) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                VStack(spacing: 0) {
                    HStack {
                        ForEach(rows[rowIndex], id: \.self) { item in
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.time)
//                                    .shadow(color: .black.opacity(0.4),
//                                            radius: 5,
//                                            x: 0,
//                                            y: 1)
                                
                                HStack(alignment: .center, spacing: 5) {
                                    Image(systemName: item.symbol)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
//                                        .shadow(color: .black.opacity(0.4),
//                                                radius: 5,
//                                                x: 0,
//                                                y: 1)
                                        .frame(width: 16)
                                    
                                    
                                    Text(item.temperature)
//                                        .shadow(color: .black.opacity(0.4),
//                                                radius: 5,
//                                                x: 0,
//                                                y: 5)
                                        .frame(height: 23)
                                }
                            }
                            .foregroundStyle(theme.secondaryTextColor)
                            .font(.system(size: 15, weight: .medium))
                            .shadow(color: .black.opacity(0.4),
                                    radius: 8,
                                    x: 0,
                                    y: 5)
                            .frame(maxWidth: .infinity)
                        }
                    }
                    
                    
                    // Add footer if not the last row
                    if rowIndex < rows.count - 1 {
                        theme.secondaryTextColor
                            .frame(maxWidth: .infinity, maxHeight: 1)
                            .opacity(0.5)
                            .padding(.vertical, 20)
                            
                    }
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 20)
        .background(
            ZStack(content: {
                VisualEffectBlur(blurStyle: .systemUltraThinMaterial)
                                .blur(radius: 42)
                
                theme.tileGradient
                
            })
            .clipShape(RoundedRectangle(cornerRadius: 25))
        )
        .padding(.horizontal, 30)
    }
}

struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: blurStyle)
    }
}

#Preview {
    WeatherView()
}
