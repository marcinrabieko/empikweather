//
//  DetailsViewModel.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 13/12/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol DetailsViewModelProtocol {
    var cities: BehaviorRelay<[City]> { get }
    var city: BehaviorRelay<City> { get }
    var disposeBag: DisposeBag { get }
    
    func searchCity(for text: String)
    func showCityWeather(city: City)
}

class DetailsViewModel {

    let cityDetails: BehaviorRelay<CityDetails?>
    let city: BehaviorRelay<City>
    let disposeBag = DisposeBag()
    
    private let accuWeatherDomainManager: AccuWeatherDomainManager
    
    init(accuWeatherDomainManager: AccuWeatherDomainManager, city: City) {
        self.accuWeatherDomainManager = accuWeatherDomainManager
        self.city = BehaviorRelay<City>(value: city)
        cityDetails = accuWeatherDomainManager.cityDetails
        fetchCityDetails()
    }
}

extension DetailsViewModel {
    private func fetchCityDetails() {
        print("details locationId:", city.value.locationId)
        accuWeatherDomainManager.details(locationId: city.value.locationId)
    }
}
