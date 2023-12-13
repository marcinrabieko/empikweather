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
    
    func autocompleteCities(for text: String)
}

class AccuWeatherDomainManager: AccuWeatherDomainManagerProtocol {
    
    let cities: BehaviorRelay<[City]> = BehaviorRelay<[City]>(value: [])

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
}
