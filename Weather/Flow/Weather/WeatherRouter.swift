//
//  
//  WeatherRouter.swift
//  Weather
//
//  Created by Viktor on 16.07.2023.
//
//

import Foundation

protocol WeatherRouterInput { }

final class WeatherRouter: WeatherRouterInput {
    
    weak var transition: ModuleTransitionHandler?
    
    // MARK: - LifeCycle
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
    // MARK: - WeatherRouterInput
}
