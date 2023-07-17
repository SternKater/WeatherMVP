//
//  
//  MainAssembly.swift
//  Weather
//
//  Created by Viktor on 15.07.2023.
//
//
//

import Foundation
import UIKit

final class MainAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        
        let view = MainViewController()
        let router = MainRouter(transition: view)
        let presenter = MainPresenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
