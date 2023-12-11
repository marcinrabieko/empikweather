//
//  Coordinator.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 10/12/2023.
//

import UIKit

protocol CoordinatorProtocol {
    var mainNavigationController: UINavigationController { get }
    var rootViewController: UIViewController { get }
}

class Coordinator: CoordinatorProtocol {
    var mainNavigationController: UINavigationController
    var rootViewController: UIViewController {
        searchViewController
    }
    
    let searchViewController: SearchViewController = {
        let viewModel = SearchViewModel()
        let view = SearchView(searchViewModel: viewModel)
        return SearchViewController(rootView: view)
    }()
    
    init(mainNavigationController: UINavigationController = UINavigationController()) {
        self.mainNavigationController = mainNavigationController
    }
}
