//
//  Environment.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Foundation

struct AccuWeatherEnvironment {
    static let apiKey = "79tTez7sCnGfQbdk5PFSDD8xce98p1qi"
    static let baseURL = URL(string: baseURLString)
    static let language = "pl-pl"
    
    private static let baseURLString = "http://dataservice.accuweather.com/"
}
