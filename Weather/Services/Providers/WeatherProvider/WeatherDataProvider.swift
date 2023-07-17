//
//  WeatherDataProvider.swift
//  Weather
//
//  Created by Viktor on 17.07.2023.
//

import Foundation
import Moya

protocol WeatherDataProviderInput {
    typealias Completion = (_ result: Result<WeatherResponse, ProjectError>) -> Void
    
    func fetchWeather(lat: Double, lon: Double, completion: @escaping Completion)
}

class WeatherDataProvider: WeatherDataProviderInput {
    
//max for free
    private let forecastLimit = 7
    
    func fetchWeather(lat: Double, lon: Double, completion: @escaping WeatherDataProviderInput.Completion) {
        let provider = MoyaProvider<Rest>()
        
        provider.request(.weather(lat, lon, self.forecastLimit)) { result in
            switch result {
            case .success(let response):
                do {
                    let weatherResponse = try response.map(WeatherResponse.self)
                    completion(.success(weatherResponse))
                } catch {
                    completion(.failure(.text("Error due parsing")))
                }
            case .failure(let moyaError):
                completion(.failure(.text(moyaError.localizedDescription)))
            }

        }
    }
    
}
