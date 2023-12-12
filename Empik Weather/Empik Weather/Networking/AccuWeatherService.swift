//
//  WeatherService.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Moya
import RxSwift

protocol AccuWeatherServiceProtocol {
    
}

struct AccuWeatherService: AccuWeatherServiceProtocol {

    private let provider = MoyaProvider<AccuWeatherAPI>()

    func searchCities(searchText: String) -> Single<String> {
        provider.rx
            .request(.search(searchText: searchText))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(String.self)
    }
}
