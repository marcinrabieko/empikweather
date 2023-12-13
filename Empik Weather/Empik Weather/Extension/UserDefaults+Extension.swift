//
//  UserDefaults+Keys.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 14/12/2023.
//

import Foundation

extension UserDefaults {
    enum Keys: String {
        case selectedCity
    }
    
    var selectedCity: Data? {
        get {
            data(forKey: Keys.selectedCity.rawValue)
        }
        set {
            setValue(newValue, forKey: Keys.selectedCity.rawValue)
        }
    }
    
    func storeSelectedCity(_ city: City) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(city)
            selectedCity = data
        } catch {
            print(error)
        }
    }
    
    func restoreSelectedCity() -> City? {
        do {
            guard let data = data(forKey: Keys.selectedCity.rawValue) else { return nil }
            return try JSONDecoder().decode(City.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
}
