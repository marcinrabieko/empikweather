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
    
    private let coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        cities = coordinator.accuWeatherDomainManager.cities
    }
}

extension SearchViewModel {
    func searchCity(for text: String) {
        print("search text:", text)
        coordinator.accuWeatherDomainManager.autocompleteCities(for: text)
    }
    
    func showCityWeather(city: City) {
        print("show city weather:", city.localizedName, " locationKey:", city.locationId)
        coordinator.showDetails(city: city)
    }
}
