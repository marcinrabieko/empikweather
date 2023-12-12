//
//  CommonModel.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Foundation

class CommonModel: Codable {
    let apiKey: String = AccuWeatherEnvironment.apiKey
    let language: String = AccuWeatherEnvironment.language
    
    private enum CodingKeys: String, CodingKey {
        case apiKey = "apiKey"
        case language = "language"
    }
}
