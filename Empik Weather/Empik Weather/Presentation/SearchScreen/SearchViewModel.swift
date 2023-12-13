//
//  SearchViewModel.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 10/12/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol SearchViewModelProtocol {
    var cities: BehaviorRelay<[City]> { get }
    var disposeBag: DisposeBag { get }
    
    func searchCity(for text: String)
    func showCityWeather(city: City)
}

class SearchViewModel {

    let cities: BehaviorRelay<[City]>
    let disposeBag = DisposeBag()
    
    private let accuWeatherDomainManager: AccuWeatherDomainManager
    
    init(accuWeatherDomainManager: AccuWeatherDomainManager) {
        self.accuWeatherDomainManager = accuWeatherDomainManager
        cities = accuWeatherDomainManager.cities
    }
}

extension SearchViewModel {
    func searchCity(for text: String) {
        print("search text:", text)
        accuWeatherDomainManager.autocompleteCities(for: text)
    }
    
    func showCityWeather(city: City) {
        print("show city weather:", city.localizedName)
    }
}
