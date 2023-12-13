//
//  DetailsViewController.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 13/12/2023.
//

import UIKit

class DetailsViewController: UIViewController {

    let rootView: DetailsView
    
    init(rootView: DetailsView) {
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

extension DetailsViewController {
    private func createView() {
        view.addSubview(rootView)
        rootView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
