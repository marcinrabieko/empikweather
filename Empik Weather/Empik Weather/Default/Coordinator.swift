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
    var detailsViewController: DetailsViewController?
    
    override init() {
        accuWeatherDomainManager = AccuWeatherDomainManager()
        super.init()
        
        // Configure root controller
        mainNavigationController = navigationController()
    }
}

extension Coordinator {
    func showDetails(city: City) {
        let viewModel = DetailsViewModel(accuWeatherDomainManager: accuWeatherDomainManager, city: city)
        let view = DetailsView(viewModel: viewModel)
        detailsViewController = DetailsViewController(rootView: view)
        guard let detailsViewController else { return }
        mainNavigationController?.pushViewController(detailsViewController, animated: true)
    }
}

extension Coordinator {
    private func searchViewController() -> SearchViewController {
        let rootViewModel = SearchViewModel(coordinator: self)
        let rootView = SearchView(viewModel: rootViewModel)
        return SearchViewController(rootView: rootView)
    }
    
    private func navigationController() -> UINavigationController {
        let rootViewController = rootViewController()
        return UINavigationController(rootViewController: rootViewController)
    }
    
    private func rootViewController() -> UIViewController {
        searchViewController()
    }
}
