//
//  Coordinator.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 10/12/2023.
//

import UIKit

protocol CoordinatorProtocol {
    var mainNavigationController: UINavigationController? { get }
    var accuWeatherDomainManager: AccuWeatherDomainManager { get }

    func showDetails(city: City)
}

class Coordinator: NSObject, CoordinatorProtocol {

    let accuWeatherDomainManager: AccuWeatherDomainManager
    var mainNavigationController: UINavigationController?
    
    private var rootViewController: UIViewController {
        searchViewController()
    }
    
    override init() {
        accuWeatherDomainManager = AccuWeatherDomainManager()
        super.init()
        
        // Configure root controller
        mainNavigationController = navigationController()
        
        // Restore and display details of previously selected city
        if let selectedCity = UserDefaults.standard.restoreSelectedCity() {
            showDetails(city: selectedCity)
        }
    }
}

extension Coordinator {
    func showDetails(city: City) {
        let detailsViewController = detailsViewController(city: city)
        mainNavigationController?.pushViewController(detailsViewController, animated: true)
    }
}

extension Coordinator {
    private func searchViewController() -> SearchViewController {
        let viewModel = SearchViewModel(coordinator: self)
        let view = SearchView(viewModel: viewModel)
        return SearchViewController(rootView: view)
    }
    
    private func detailsViewController(city: City) -> DetailsViewController {
        let viewModel = DetailsViewModel(accuWeatherDomainManager: accuWeatherDomainManager, city: city)
        let view = DetailsView(viewModel: viewModel)
        return DetailsViewController(rootView: view)
    }
    
    private func navigationController() -> UINavigationController {
        let rootViewController = rootViewController
        return UINavigationController(rootViewController: rootViewController)
    }
}
