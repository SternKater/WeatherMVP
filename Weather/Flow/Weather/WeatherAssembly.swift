//
//  
//  WeatherAssembly.swift
//  Weather
//
//  Created by Viktor on 16.07.2023.
//
//
//

import Foundation
import CoreLocation
import UIKit

final class WeatherAssembly: Assembly {
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        
        let model = model as! Model
        
        let view = WeatherViewController()
        let router = WeatherRouter(transition: view)
        let presenter = WeatherPresenter(coords: model.coords)
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
}

extension WeatherAssembly {
    struct Model: TransitionModel {
        let coords: CLLocation
    }
}
