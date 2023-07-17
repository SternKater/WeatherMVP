//
//  ModuleTransitionHandler.swift
//
//  Support
//

import UIKit

protocol ModuleTransitionHandler: AnyObject {
    func present(with model: TransitionModel, ModuleType: Assembly.Type)
    func present(ModuleType: Assembly.Type)
      func show(with model: TransitionModel, ModuleType: Assembly.Type)
    func push(with model: TransitionModel, ModuleType: Assembly.Type)
    func push(ModuleType: Assembly.Type)
    func pop()
    func popToRootViewController()
    func closeModule()
    func closeModule(_ completion: (() -> Void)?)
    func openAsRoot(ModuleType: Assembly.Type)
    
    func openTabBar()
    func openAsNavBar()
}

extension UIViewController: ModuleTransitionHandler {
  
    func openTabBar() {
        return
    }
    
    func openAsNavBar() {
        guard let scene = UIApplication.shared.connectedScenes.first else {
            return
        }
        guard let delegate = scene.delegate as? SceneDelegate else {
            return
        }
        guard let window = delegate.window else {
            return
        }
        window.rootViewController = UINavigationController(rootViewController: self)
    }
    
    func present(with model: TransitionModel, ModuleType: Assembly.Type) {
      let view = ModuleType.assembleModule(with: model)
      present(view, animated: true, completion: nil)
    }

    func present(ModuleType: Assembly.Type) {
      let view = ModuleType.assembleModule()
      present(view, animated: true, completion: nil)
    }
    
      func show(with model: TransitionModel, ModuleType: Assembly.Type) {
      let view = ModuleType.assembleModule(with: model)
      show(view, sender: nil)
    }
    
    func pop() {
      navigationController?.popViewController(animated: true)
    }
    
    func popToRootViewController() {
      navigationController?.popToRootViewController(animated: true)
    }
    
    func push(with model: TransitionModel, ModuleType: Assembly.Type) {
      let view = ModuleType.assembleModule(with: model)
      navigationController?.pushViewController(view, animated: true)
    }
    
    func push(ModuleType: Assembly.Type) {
      let view = ModuleType.assembleModule()
      navigationController?.pushViewController(view, animated: true)
    }
    
    func closeModule() {
      closeModule(nil)
    }
    
    func closeModule(_ completion: (() -> Void)?) {
      dismiss(animated: true, completion: completion)
    }
    
    func openAsRoot(ModuleType: Assembly.Type) {
        guard let scene = UIApplication.shared.connectedScenes.first else {
            return
        }
        guard let delegate = scene.delegate as? SceneDelegate else {
            return
        }
        guard let window = delegate.window else {
            return
        }
        let view = ModuleType.assembleModule()
        window.rootViewController = view
    }
}
