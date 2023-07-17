//
//  
//  WeatherView.swift
//  Weather
//
//  Created by Viktor on 16.07.2023.
//
//

import UIKit

final class WeatherView: UIView {
  
  // MARK: - Properties
  
    weak var delegate: WeatherViewDelegate?
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "No data"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    let currentDate: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let currentTemp: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let forecastTemp: UITextView = {
        let textView = UITextView()
        textView.isHidden = true
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 22)
        return textView
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
  // MARK: - SetUp
  
    private func setupUI() {
        self.backgroundColor = .white
        
        self.addSubview(self.greetingLabel)
        NSLayoutConstraint.activate([
            self.greetingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.greetingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.greetingLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 21),
            self.greetingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])

        self.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 21),
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 21)
        ])

        self.addSubview(self.currentDate)
        NSLayoutConstraint.activate([
            self.currentDate.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.currentDate.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.currentDate.heightAnchor.constraint(equalToConstant: 21),
            self.currentDate.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15)
        ])

        self.addSubview(self.currentTemp)
        NSLayoutConstraint.activate([
            self.currentTemp.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.currentTemp.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.currentTemp.heightAnchor.constraint(equalToConstant: 50),
            self.currentTemp.topAnchor.constraint(equalTo: self.currentDate.bottomAnchor, constant: 15)
        ])
        
        self.addSubview(self.forecastTemp)
        NSLayoutConstraint.activate([
            self.forecastTemp.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.forecastTemp.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.forecastTemp.topAnchor.constraint(equalTo: self.currentTemp.bottomAnchor, constant: 50),
            self.forecastTemp.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

}
