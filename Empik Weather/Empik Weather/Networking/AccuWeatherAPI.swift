//
//  WeatherAPI.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Moya

enum AccuWeatherAPI {
    case search(searchText: String)
    case details(locationId: String)
}

extension AccuWeatherAPI: TargetType {

    var baseURL: URL {
        switch self {
        case .search, .details:
            return AccuWeatherEnvironment.baseURL ?? URL(fileURLWithPath: "")
        }
    }

    var path: String {
        switch self {
        case .search:
            return "locations/v1/cities/autocomplete"
        case let .details(locationId):
            return "currentconditions/v1/\(locationId)"
        }
    }

    var method: Method {
        .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        var params = authParams
        
        switch self {
        case let .search(searchText):
            params["q"] = searchText
        default: ()
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
    }

    var headers: [String: String]? {
        return nil
    }
    
    private var authParams: Dictionary<String, Any> {
        ["apikey": AccuWeatherEnvironment.apiKey,
         "language": AccuWeatherEnvironment.language]
    }
}
