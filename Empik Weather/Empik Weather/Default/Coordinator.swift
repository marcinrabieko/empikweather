//
//  Coordinator.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 10/12/2023.
//

import UIKit

protocol CoordinatorProtocol {
    var mainNavigationController: UINavigationController { get }
}

class Coordinator: CoordinatorProtocol {
    let accuWeatherDomainManager: AccuWeatherDomainManager
    
    let mainNavigationController: UINavigationController
    let searchViewController: SearchViewController
    
    init() {
        accuWeatherDomainManager = AccuWeatherDomainManager()
        
        // Configure root view controller
        let rootViewModel = SearchViewModel(accuWeatherDomainManager: accuWeatherDomainManager)
        let rootView = SearchView(viewModel: rootViewModel)
        searchViewController = SearchViewController(rootView: rootView)
        mainNavigationController = UINavigationController(rootViewController: searchViewController)
    }
}
