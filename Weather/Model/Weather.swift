//
//  Weather.swift
//  Weather
//
//  Created by Viktor on 17.07.2023.
//

import Foundation

struct WeatherResponse: Codable {
//current date
    let now_dt: String
    
//place info
    struct WeatherPlaceInfo: Codable {
        struct Details: Codable {
            let name: String
        }
        let tzinfo: Details
    }
    let info: WeatherPlaceInfo
    
//current weather
    struct WeatherPlace: Codable {
        let temp: Int
        let feels_like: Int
    }
    let fact: WeatherPlace
    
//forecast weather
    struct WeatherPlaceForecast: Codable {
        struct Parts: Codable {
            struct Short: Codable {
                let temp: Int
            }
            let day_short: Short
            let night_short: Short
        }
        let date: String
        let parts: Parts
        
    }
    let forecasts: [WeatherPlaceForecast]
}

extension WeatherResponse.WeatherPlaceForecast {
    var asHumanString: String {
        return "\(date): Day(\(parts.day_short.temp)°) / Night(\(parts.night_short.temp)°)"
    }
}
