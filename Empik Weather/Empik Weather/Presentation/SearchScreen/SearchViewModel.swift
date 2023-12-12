//
//  SearchViewModel.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 10/12/2023.
//

import Foundation

protocol SearchViewModelProtocol {
    func searchCity(for text: String)
}

class SearchViewModel {
    
    private let accuWeatherDomainManager: AccuWeatherDomainManager
    
    init(accuWeatherDomainManager: AccuWeatherDomainManager) {
        self.accuWeatherDomainManager = accuWeatherDomainManager
    }
    
    func searchCity(for text: String) {
        print("search text:", text)
        accuWeatherDomainManager.searchCities(for: text)
    }
}
