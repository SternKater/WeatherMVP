//
//  
//  WeatherPresenter.swift
//  Weather
//
//  Created by Viktor on 16.07.2023.
//
//

import Foundation
import CoreLocation

protocol WeatherPresenterOutput: AnyObject {
    func startLoading()
    func stopLoading()
    func showError(error: String)
    func setTitle(text: String)
    func setCurrentDate(text: String)
    func setTemperature(value: Int, feels: Int)
    func setForecast(text: String)
}

protocol WeatherPresenterInput: ViewOutput { }

final class WeatherPresenter: WeatherPresenterInput {
  
  // MARK: - Properties
  
    weak var view: WeatherPresenterOutput?
    var router: WeatherRouterInput?
    private let weatherProvider: WeatherDataProviderInput
    
    private let coords: CLLocation

  // MARK: - Init
  
    init(coords: CLLocation) {
        self.coords = coords
        self.weatherProvider = WeatherDataProvider()
    }

  // MARK: - WeatherPresenterInput
    func viewIsReady() {
        self.weatherProvider.fetchWeather(lat: self.coords.coordinate.latitude, lon: self.coords.coordinate.longitude) { [weak self] result in
            guard let self = self else { return }
            self.view?.stopLoading()
            switch result {
            case .success(let weather):
                self.view?.setTitle(text: weather.info.tzinfo.name)
                self.view?.setCurrentDate(text: String(weather.now_dt.prefix(10)))
                self.view?.setTemperature(value: weather.fact.temp, feels: weather.fact.feels_like)
                self.view?.setForecast(text: weather.forecasts.reduce(""){ $0.appending("\($1.asHumanString)\n") })
            case .failure(let error): self.view?.showError(error: error.errorString)
            }
            
        }
    }
}
