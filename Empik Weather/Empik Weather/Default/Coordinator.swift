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
    let mainNavigationController: UINavigationController

    let searchViewController: SearchViewController = {
        let viewModel = SearchViewModel()
        let view = SearchView(viewModel: viewModel)
        return SearchViewController(rootView: view)
    }()
    
    init() {
        mainNavigationController = UINavigationController(rootViewController: searchViewController)
    }
}
