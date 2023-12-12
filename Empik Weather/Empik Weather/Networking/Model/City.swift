//
//  City.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Foundation

class City: Decodable {
    let key: String
    let localizedName: String
    let country: Country
    let administrativeArea: AdministrativeArea
    
    var details: String {
        "\(administrativeArea.localizedName) (\(country.localizedName))"
    }
    
    private enum CodingKeys: String, CodingKey {
        case key = "Key"
        case localizedName = "LocalizedName"
        case country = "Country"
        case administrativeArea = "AdministrativeArea"
    }
}

class Country: Decodable {
    let localizedName: String
    
    private enum CodingKeys: String, CodingKey {
        case localizedName = "LocalizedName"
    }
}

class AdministrativeArea: Decodable {
    let localizedName: String

    private enum CodingKeys: String, CodingKey {
        case localizedName = "LocalizedName"
    }
}
