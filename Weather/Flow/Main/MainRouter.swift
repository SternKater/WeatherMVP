//
//  
//  MainRouter.swift
//  Weather
//
//  Created by Viktor on 15.07.2023.
//
//

import Foundation
import CoreLocation

protocol MainRouterInput {
    func showWeatherScreen(coords: CLLocation)
}

final class MainRouter: MainRouterInput {
    
    weak var transition: ModuleTransitionHandler?
    
    // MARK: - LifeCycle
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
    // MARK: - MainRouterInput
    func showWeatherScreen(coords: CLLocation) {
        self.transition?.push(with: WeatherAssembly.Model(coords: coords), ModuleType: WeatherAssembly.self)
    }
}
