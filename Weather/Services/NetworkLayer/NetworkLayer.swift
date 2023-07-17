//
//  NetworkLayer.swift
//  Template
//
//

import Foundation
import Moya

public enum Rest {
    case weather(Double, Double, Int)
}

extension Rest: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://api.weather.yandex.ru")!
    }
    
    public var path: String {
        switch self {
        case .weather: return "/v2/forecast"
        }
    }
    
    public var method: Moya.Method {
        return Moya.Method.get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .weather(let lat, let lon, let limit):
            return .requestParameters(parameters: ["lat": lat, "lon": lon, "limit": limit, "lang": "ru_RU", "hours": "false", "extra": "false"], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "X-Yandex-API-Key": "45036147-9140-499c-b021-64e2d6796e4b"]
    }
    
    public var validationType: ValidationType {
      return .successCodes
    }
}
