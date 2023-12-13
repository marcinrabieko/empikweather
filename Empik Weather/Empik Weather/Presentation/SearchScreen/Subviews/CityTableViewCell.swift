//
//  CityTableViewCell.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 12/12/2023.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CityTableViewCell {
    func configure(city: City) {
        nameLabel.text = city.localizedName
        detailsLabel.text = city.details
    }
}

extension CityTableViewCell {
    private func setupUI() {
        backgroundColor = .init(white: 0, alpha: 0.05)
        let selectedView = UIView()
        selectedView.backgroundColor = .init(white: 0, alpha: 0.1)
        selectedBackgroundView = selectedView
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailsLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.top.equalToSuperview().offset(8)
        }

        detailsLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(nameLabel)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
}
