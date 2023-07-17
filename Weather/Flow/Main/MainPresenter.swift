//
//  
//  MainPresenter.swift
//  Weather
//
//  Created by Viktor on 15.07.2023.
//
//

import Foundation
import CoreLocation

protocol MainPresenterOutput: AnyObject {
    func startLoading()
    func setResult(text: String)
}

protocol MainPresenterInput: ViewOutput { }

final class MainPresenter: MainPresenterInput {
  
  // MARK: - Properties
  
    weak var view: MainPresenterOutput?
    var router: MainRouterInput?
    
    private let locationProvider: LocationProviderInput

  // MARK: - Init
  
    init() {
        self.locationProvider = LocationProvider()
    }

  // MARK: - MainPresenterOutput
    func viewDidAppear() {
        self.view?.startLoading()
        self.locationProvider.fetchCoords { [weak self] coords in
            guard let self = self else { return }
            self.view?.setResult(text: "Your location is \(coords.coordinate.latitude), \(coords.coordinate.longitude)")
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                self.router?.showWeatherScreen(coords: coords)
            }
        }
    }
  
}
