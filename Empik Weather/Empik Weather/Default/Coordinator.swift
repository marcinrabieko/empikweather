//
//  Coordinator.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 10/12/2023.
//

import UIKit

protocol CoordinatorProtocol {
    var mainNavigationController: UINavigationController { get }
    
    func showDetails(locationId: String)
}

class Coordinator: CoordinatorProtocol {
    let accuWeatherDomainManager: AccuWeatherDomainManager
    
    let mainNavigationController: UINavigationController
    let searchViewController: SearchViewController
    var detailsViewController: DetailsViewController?
    
    init() {
        accuWeatherDomainManager = AccuWeatherDomainManager()
        
        // Configure root view controller
        let rootViewModel = SearchViewModel(accuWeatherDomainManager: accuWeatherDomainManager)
        let rootView = SearchView(viewModel: rootViewModel)
        searchViewController = SearchViewController(rootView: rootView)
        mainNavigationController = UINavigationController(rootViewController: searchViewController)
    }
}

extension Coordinator {
    func showDetails(locationId: String) {
        let viewModel = DetailsViewModel(accuWeatherDomainManager: accuWeatherDomainManager, locationId: locationId)
        let view = DetailsView(viewModel: viewModel)
        detailsViewController = DetailsViewController(rootView: view)
        guard let detailsViewController else { return }
        mainNavigationController.pushViewController(detailsViewController, animated: true)
    }
}
