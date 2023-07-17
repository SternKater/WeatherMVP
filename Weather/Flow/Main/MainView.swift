//
//  
//  MainView.swift
//  Weather
//
//  Created by Viktor on 15.07.2023.
//
//

import UIKit

final class MainView: UIView {
  
  // MARK: - Properties
  
    weak var delegate: MainViewDelegate?
    
    let serviceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Locating coords..."
        label.textAlignment = .center
        return label
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
        
        self.addSubview(self.serviceLabel)
        NSLayoutConstraint.activate([
            self.serviceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.serviceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.serviceLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 21),
            self.serviceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

}
