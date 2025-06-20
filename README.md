# 🌤️ Weather App

A beautifully designed iOS weather app built using **SwiftUI** and **WeatherKit**, showcasing current weather conditions, 12-hour forecasts, and more — all with a dynamic, theme-adaptive interface.

![Figma Design Preview](https://www.figma.com/file/RjucsLMfmhElYxIqBEP5Ir/Weather-App-%7C-Template--Community-?type=design&node-id=0-1)

---

## ✨ Features

- **📍 Current Location Weather**
  - Auto-detects and displays weather data for the user’s current location.
  
- **🌡️ Current Temperature**
  - Shows the daytime temperature from WeatherKit.

- **🥵 Feels Like Temperature**
  - Displays the real-feel value considering humidity, wind, and other factors.

- **🌅 Sunset Time**
  - Retrieves and displays the sunset timing based on the user's location.

- **🕒 12-Hour Forecast**
  - Shows a smooth horizontal scrollable view with temperature and condition updates for the next 12 hours.

- **🎨 Dynamic Themes**
  - App background image and colors change according to the current weather:
    - ☀️ Sunny  
    - 🌧️ Rainy  
    - ☁️ Cloudy  
    - ❄️ Snowy  

---

## 🧩 Technologies Used

- `SwiftUI`
- `WeatherKit`
- `CoreLocation`
- `Combine`
- `Xcode 15+`
- `iOS 17+` compatible

---

## 🎨 UI Design

- UI designed by **Mark Vassilevsky**
- [Figma Design Link](https://www.figma.com/design/RjucsLMfmhElYxIqBEP5Ir/Weather-App-%7C-Template--Community-?node-id=0-1&p=f&t=zM6d9jU1TNdvy0Vp-0)

---

## 🚀 Getting Started

### Prerequisites
- Xcode 15 or higher
- iOS 17+ deployment target
- WeatherKit entitlements (requires Apple Developer account)

### Setup

1. Clone the repository:   
   git clone https://github.com/suraj-shetty/WeatherApp.git

2. Open the project in Xcode:   
    open WeatherKitApp.xcodeproj
    
3. Enable WeatherKit access:
    Go to Signing & Capabilities
    Add WeatherKit entitlement

📸 Screenshots
[Cloudy.png](https://github.com/suraj-shetty/WeatherApp/blob/main/Screenshots/cloudy.png)

📌 To-Do / Roadmap

 1. Add support for weekly forecast
 2. Expand theme variations (e.g., Thunderstorm, Fog)
 3. Add dark mode support
 4. Add support for multiple saved locations
 
 
 🧑‍🎨 Credits

    Design: Mark Vassilevsky
    Weather API: WeatherKit by Apple


📄 License
    This project is licensed under the MIT License.
