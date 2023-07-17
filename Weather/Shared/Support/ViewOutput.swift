//
//  ViewOutput.swift
//
//  Support
//

import Foundation

protocol ViewOutput: AnyObject {
    func viewIsReady()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
}

extension ViewOutput {
    
    // MARK: - Default implementation
    
    func viewIsReady() { }
    func viewWillAppear() { }
    func viewDidAppear() { }
    func viewWillDisappear() { }
}
