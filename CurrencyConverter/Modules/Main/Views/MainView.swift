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
    
    private var viewModel: MainViewModel
    
    init(with viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupButton()
        bindActions()
        setupIndicator()
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
       }
    
    @objc func didTapButton() {
        viewModel.showCurrencies()
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

// stworzyć tableView, zmienić funckje didtapbutton, 
