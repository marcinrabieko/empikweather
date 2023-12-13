//
//  SearchView.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 10/12/2023.
//

import UIKit

class SearchView: UIView {
    let viewModel: SearchViewModel
    
    private let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.searchBarStyle = .minimal
        view.barStyle = .default
        view.searchTextField.leftView?.tintColor = .systemBlue
        view.searchTextField.backgroundColor = .init(white: 1, alpha: 0.1)
        view.searchTextField.textColor = .darkGray
        view.returnKeyType = .done
        view.enablesReturnKeyAutomatically = false
        view.searchTextField.placeholder = "search_hint".localized
        return view
    }()
    
    private let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.keyboardDismissMode = .interactive
        view.register(CityTableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
        return view
    }()
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView {
    private func configureUI() {
        backgroundColor = .white
        addSubview(searchBar)
        addSubview(tableView)
        searchBar.delegate = self
        
        setupConstraints()
        bindUI()
    }
    
    private func setupConstraints() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(20).priority(.low)
            $0.trailing.equalToSuperview().offset(-20).priority(.low)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    private func bindUI() {
        viewModel.cities
            .bind(to: tableView.rx.items(cellIdentifier: "CityTableViewCell",
                                         cellType: CityTableViewCell.self)) { _, model, cell in
                cell.configure(city: model)
            }.disposed(by: viewModel.disposeBag)
        
        tableView.rx.modelSelected(City.self)
            .subscribe(onNext: { [weak self] city in
                self?.searchBar.resignFirstResponder()
                self?.viewModel.showCityWeather(city: city)
            }).disposed(by: viewModel.disposeBag)
    }
}

extension SearchView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBar(_: UISearchBar, textDidChange searchText: String) {
        viewModel.searchCity(for: searchText)
    }
}
