//
//  AccuWeatherParameter.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Foundation

class SearchModel: Codable {
    let searchText: String
    
    init(searchText: String) {
        self.searchText = searchText
    }
    
    private enum CodingKeys: String, CodingKey {
        case searchText = "q"
    }
}
