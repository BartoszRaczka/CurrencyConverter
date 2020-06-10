//
//  MainView.swift
//  CurrencyConverter
//
//  Created by MacBook on 05/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
    
    private var button: ButtonView!
    private var indicator: UIActivityIndicatorView!
    
    private var viewModel: MainViewModel!
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        setupTitleLabel()
//        bindActions()
//        setupIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func bindActions() {
//           viewModel.onShowLoader = { [weak self] showLoader in
//               if showLoader {
//                   self?.indicator.startAnimating()
//               } else {
//                   self?.indicator.stopAnimating()
//               }
//           }
//       }
    
    private func setupTitleLabel() {
        button = ButtonView()
        addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.top.equalTo(snp.top).offset(60.0)
            make.height.equalTo(60.0)
        }
    }
    
//    private func setupIndicator() {
//        indicator = UIActivityIndicatorView(style: .large)
//        indicator.hidesWhenStopped = true
//        indicator.snp.makeConstraints { (make) in
//
//        }
//    }
//
}

