//
//  
//  MainViewController.swift
//  Weather
//
//  Created by Viktor on 15.07.2023.
//
//

import UIKit

protocol MainViewDelegate: AnyObject { }

final class MainViewController: UIViewController, MainPresenterOutput, MainViewDelegate {
  
  // MARK: - Properties
  
    var presenter: MainPresenterInput?
    var contentView: MainView = {
        let view = MainView()
        return view
    }()
    
  // MARK: - LifeCycle
  
    override func loadView() {
        self.contentView.delegate = self
        self.view = self.contentView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.viewDidAppear()
    }
    
    // MARK: - MainPresenterOutput
    func startLoading() {
        self.showAwaitingIndicator()
    }
    
    func setResult(text: String) {
        self.hideAwaitingIndicator(hud: nil)
        (self.view as! MainView).serviceLabel.text = text
    }
}

