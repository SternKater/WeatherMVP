//
//  WrappedValues.swift
//

import Foundation

fileprivate protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
}

// MARK: - UserDefaults
@propertyWrapper struct UserDefaultsBacked<Value: Codable> {
    private let key: String
    private let defaultValue: Value
    private let storage: UserDefaults = .standard
    
    var wrappedValue: Value {
        get {
            if let data = self.storage.value(forKey: self.key) as? Data {
                let value = try? JSONDecoder().decode(Value.self, from: data)
                return value ?? self.defaultValue
            }
            else {
                let value = self.storage.value(forKey: self.key) as? Value
                return value ?? self.defaultValue
            }
        }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                self.storage.removeObject(forKey: self.key)
            }
            else {
                if let encoded = try? JSONEncoder().encode(newValue) {
                    self.storage.set(encoded, forKey: self.key)
                }
                else {
                    self.storage.removeObject(forKey: self.key)
                }
            }
        }
    }
    
    init(wrappedValue defaultValue: Value, key: String) {
        self.defaultValue = defaultValue
        self.key = key
    }
}

extension UserDefaultsBacked where Value: ExpressibleByNilLiteral {
    init(key: String) {
        self.init(wrappedValue: nil, key: key)
    }
}
