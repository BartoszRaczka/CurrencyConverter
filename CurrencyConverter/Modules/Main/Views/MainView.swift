//
//  MainView.swift
//  CurrencyConverter
//
//  Created by MacBook on 05/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class MainView: UIView {
    
    private var button: UIButton!
    private var indicator: UIActivityIndicatorView!
    
    private var tableView: UITableView! // zadeklarować i stworzyć instancję w setupie lepiej
    
    private var viewModel: MainViewModel
    
    init(with viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupButton()
        bindActions()
        setupIndicator()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func bindActions() {
        viewModel.onShowLoader = { [weak self] showLoader in
            if showLoader {
                self?.indicator.startAnimating()
            } else {
                self?.indicator.stopAnimating()
            }
        }
        viewModel.onReloadData = { [weak self] in
            self?.tableView.reloadData()
        }
   }
    
    @objc func didTapButton() {
        viewModel.onButtonTapped?()
    }
    
      func setupButton() {
           button = UIButton()
           button.setTitle("Check currencies", for: .normal)
           button.backgroundColor = .black
           
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
           
           addSubview(button)
           
           button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
           }
       }
    
    private func setupIndicator() {
        indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        addSubview(indicator)
        
        indicator.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

extension MainView: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(button.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var title = "" 
        if indexPath.row == 0 {
            title = viewModel.fromCurrency ?? "Pick currency"
        } else if indexPath.row == 1 {
            title = viewModel.toCurrency ?? "Pick currency"
        }
        
        cell.textLabel?.text = title
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.showCurrencies(for: indexPath)
    }
    
}


