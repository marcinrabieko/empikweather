//
//  DetailsView.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 13/12/2023.
//

import UIKit

class DetailsView: UIView {
    let viewModel: DetailsViewModel
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsView {
    private func configureUI() {
        backgroundColor = .white
        
        setupConstraints()
        bindUI()
    }
    
    private func setupConstraints() {
    }
    
    private func bindUI() {
        viewModel.cityDetails
            .bind { [weak self] cityDetails in
                guard let self, let cityDetails else { return }
                self.configureCityDetailsUI(cityDetails)
            }.disposed(by: viewModel.disposeBag)
    }
    
    private func configureCityDetailsUI(_ cityDetails: CityDetails) {
        
    }
}
