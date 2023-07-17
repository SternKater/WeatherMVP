//
//  UIViewController+Extension.swift
//  Weather
//
//  Created by Viktor on 15.07.2023.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    
    // MARK: - UI
    
    @discardableResult
    func showAwaitingIndicator() -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .indeterminate
        hud.label.text = "Loading"
        
        return hud
    }
    
    func hideAwaitingIndicator(hud: MBProgressHUD?) {
        if let hud = hud {
            hud.hide(animated: true)
        }
        else {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}

