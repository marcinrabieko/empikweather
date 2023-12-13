//
//  MoyaProvider+Init.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import Moya

extension MoyaProvider {
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.httpMaximumConnectionsPerHost = 30
        configuration.timeoutIntervalForRequest = 30
        let session = Session(configuration: configuration, startRequestsImmediately: false)
        self.init(session: session, plugins: [NetworkLoggerPlugin()].compactMap { $0 })
    }
}

extension NetworkLoggerPlugin {
    convenience init() {
        let configuration = NetworkLoggerPlugin.Configuration(logOptions: [.requestMethod, .requestBody, .successResponseBody, .errorResponseBody])
        self.init(configuration: configuration)
    }
}
