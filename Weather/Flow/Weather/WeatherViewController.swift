//
//  
//  WeatherViewController.swift
//  Weather
//
//  Created by Viktor on 16.07.2023.
//
//

import UIKit

protocol WeatherViewDelegate: AnyObject { }

final class WeatherViewController: UIViewController, WeatherPresenterOutput, WeatherViewDelegate {
  
  // MARK: - Properties
  
    var presenter: WeatherPresenterInput?
    var contentView: WeatherView = {
        let view = WeatherView()
        return view
    }()
    
  // MARK: - LifeCycle
  
    override func loadView() {
        self.contentView.delegate = self
        self.view = self.contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.presenter?.viewIsReady()
    }
    
    // MARK: - PresenterOutput
    func startLoading() {
        self.showAwaitingIndicator()
    }
    
    func stopLoading() {
        self.hideAwaitingIndicator(hud: nil)
        self.contentView.greetingLabel.isHidden = true
    }
    
    func showError(error: String) {
        self.contentView.greetingLabel.isHidden = false
        self.contentView.greetingLabel.text = error
    }
    
    func setTitle(text: String) {
        self.contentView.titleLabel.isHidden = false
        self.contentView.titleLabel.text = text
    }
    
    func setCurrentDate(text: String) {
        self.contentView.currentDate.isHidden = false
        self.contentView.currentDate.text = text
    }
    
    func setTemperature(value: Int, feels: Int) {
        self.contentView.currentTemp.isHidden = false
        self.contentView.currentTemp.text = "\(value)°(feels like \(feels)°)"
    }
    
    func setForecast(text: String) {
        self.contentView.forecastTemp.isHidden = false
        self.contentView.forecastTemp.text = text
    }
}

