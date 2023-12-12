//
//  WeatherAPI.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Moya

enum AccuWeatherAPI {
    case search(searchText: String)
}

extension AccuWeatherAPI: TargetType {

    var baseURL: URL {
        switch self {
        case .search:
            return AccuWeatherEnvironment.baseURL ?? URL(fileURLWithPath: "")
        }
    }

    var path: String {
        switch self {
        case .search:
            return "/locations/v1/cities/search"
        }
    }

    var method: Method {
        .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case let .search(searchText):
            let params = ["apiKey": AccuWeatherEnvironment.apiKey,
                          "language": AccuWeatherEnvironment.language,
                          "q": searchText]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
