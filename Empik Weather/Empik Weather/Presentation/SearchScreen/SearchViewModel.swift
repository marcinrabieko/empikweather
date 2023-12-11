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
    
    func searchCity(for text: String) {
        print(text)
    }
}
