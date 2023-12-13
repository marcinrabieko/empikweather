//
//  DetailsView.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 13/12/2023.
//

import UIKit

class DetailsView: UIView {
    private let viewModel: DetailsViewModel
    
    private let cityNameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.font = .systemFont(ofSize: 30, weight: .medium)
        return view
    }()
    
    private let cityDetailsLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.font = .systemFont(ofSize: 16, weight: .thin)
        return view
    }()
    
    private let temperatureLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 90, weight: .thin)
        return view
    }()
    
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
        addSubview(cityNameLabel)
        addSubview(cityDetailsLabel)
        addSubview(temperatureLabel)
        
        setupConstraints()
        bindUI()
    }
    
    private func setupConstraints() {
        cityNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(safeAreaLayoutGuide).offset(50)
        }
        
        cityDetailsLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(cityNameLabel.snp.bottom).offset(10)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.centerX.equalTo(cityNameLabel)
            $0.top.equalTo(cityDetailsLabel.snp.bottom).offset(50)
        }
    }
    
    private func bindUI() {
        viewModel.cityDetails
            .bind { [weak self] cityDetails in
                guard let self, let cityDetails else { return }
                let temperature = cityDetails.temperature.metric.value
                self.temperatureLabel.text = "\(String(temperature)) °C"
                self.temperatureLabel.textColor = temperature.color
            }.disposed(by: viewModel.disposeBag)
        
        viewModel.city
            .bind { [weak self] city in
                guard let self else { return }
                self.cityNameLabel.text = city.localizedName
                self.cityDetailsLabel.text = city.details
            }.disposed(by: viewModel.disposeBag)
    }
}
