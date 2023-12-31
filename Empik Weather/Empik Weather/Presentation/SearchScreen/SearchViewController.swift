//
//  ViewController.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 10/12/2023.
//

import UIKit

class SearchViewController: UIViewController {

    let rootView: SearchView
    
    init(rootView: SearchView) {
        self.rootView = rootView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        createView()
    }
}

extension SearchViewController {
    private func createView() {
        view.addSubview(rootView)
        rootView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
