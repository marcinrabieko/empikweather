//
//  WeatherService.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Moya
import RxSwift

protocol AccuWeatherServiceProtocol {
    func searchCities(searchText: String) -> Single<[City]>
}

struct AccuWeatherService: AccuWeatherServiceProtocol {

    private let provider = MoyaProvider<AccuWeatherAPI>()

    func searchCities(searchText: String) -> Single<[City]> {
        provider.rx
            .request(.search(searchText: searchText))
            .filterSuccessfulStatusAndRedirectCodes()
            .map([City].self)
    }
}
