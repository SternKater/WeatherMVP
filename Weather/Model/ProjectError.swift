//
//  ProjectError.swift
//  Template
//
//  Created by Viktor on 11.10.2022.
//

import Foundation

enum ProjectError: Swift.Error {
    
    case text(String)
    
    var errorString: String {
        switch self {
        case .text(let value): return value
        }
    }
}
