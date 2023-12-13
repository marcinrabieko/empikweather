//
//  CityDetails.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 13/12/2023.
//

import Foundation

class CityDetails: Decodable {
    
    let weatherText: String
    let temperature: Temperature
    
    var formattedTemperature: String {
        String(temperature.metric.value)
    }
    
    private enum CodingKeys: String, CodingKey {
        case weatherText = "WeatherText"
        case temperature = "Temperature"
    }
}

class Temperature: Decodable {
    let metric: Metric
    
    private enum CodingKeys: String, CodingKey {
        case metric = "Metric"
    }
}

class Metric: Decodable {
    let value: Double
    
    private enum CodingKeys: String, CodingKey {
        case value = "Value"
    }
}
