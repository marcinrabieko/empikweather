//
//  AccuWeatherDomainManager.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Foundation
import RxSwift

class AccuWeatherDomainManager {
    let service = AccuWeatherService()
    let disposeBag = DisposeBag()
    
    func searchCities(for text: String) {
        service.searchCities(searchText: text)
            .subscribe { cities in
                print(cities)
            }
            .disposed(by: disposeBag)
    }
}
