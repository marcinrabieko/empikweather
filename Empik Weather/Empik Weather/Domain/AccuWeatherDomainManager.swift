//
//  AccuWeatherDomainManager.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol AccuWeatherDomainManagerProtocol {
    var cities: BehaviorRelay<[City]> { get }
    var cityDetails: BehaviorRelay<CityDetails?> { get }
    
    func autocompleteCities(for text: String)
}

class AccuWeatherDomainManager: AccuWeatherDomainManagerProtocol {
    
    let cities: BehaviorRelay<[City]> = BehaviorRelay<[City]>(value: [])
    let cityDetails: BehaviorRelay<CityDetails?> = BehaviorRelay<CityDetails?>(value: nil)

    private let disposeBag = DisposeBag()
    private let service = AccuWeatherService()
    
    func autocompleteCities(for text: String) {
        service.searchCities(searchText: text)
            .subscribe(onSuccess: { [weak self] cities in
                self?.cities.accept(cities)
            }, onFailure: { [weak self] _ in
                self?.cities.accept([])
            })
            .disposed(by: disposeBag)
    }
    
    func details(locationId: String) {
        service.details(locationId: locationId)
            .subscribe(onSuccess: { [weak self] cityDetails in
                self?.cityDetails.accept(cityDetails.first)
            })
            .disposed(by: disposeBag)
    }
}
