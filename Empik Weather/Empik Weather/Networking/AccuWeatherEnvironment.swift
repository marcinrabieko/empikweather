//
//  Environment.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Foundation

struct AccuWeatherEnvironment {
    static let apiKey = "nt2zAdA8GU9GuytqLhHAOUE7goLS7gZr"
    static let baseURL = URL(string: baseURLString)
    static let language = "pl-pl"
    
    private static let baseURLString = "http://dataservice.accuweather.com/"
}
