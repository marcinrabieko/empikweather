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
    var disposeBag: DisposeBag { get }
    
    func searchCity(for text: String)
    func showCityWeather(city: City)
}

class DetailsViewModel {

    let cityDetails: BehaviorRelay<CityDetails?>
    let disposeBag = DisposeBag()
    
    private let accuWeatherDomainManager: AccuWeatherDomainManager
    
    init(accuWeatherDomainManager: AccuWeatherDomainManager, locationId: String) {
        self.accuWeatherDomainManager = accuWeatherDomainManager
        cityDetails = accuWeatherDomainManager.cityDetails
        cityDetails(for: locationId)
    }
}

extension DetailsViewModel {
    func cityDetails(for locationId: String) {
        print("details locationId:", locationId)
        accuWeatherDomainManager.details(locationId: locationId)
    }
}
