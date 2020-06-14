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
    
    private var button: UIButton!
    private var indicator: UIActivityIndicatorView!
    
    var onButtonTapped: (() -> Void)?
    
    private var viewModel: MainViewModel
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        setupButton()
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
    
     private func setupButton() {
           button = UIButton()
           button.setTitle("Check currencies", for: .normal)
           button.backgroundColor = .black
           
           button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
           
           addSubview(button)
           
           button.snp.makeConstraints { make in
             make.edges.equalToSuperview()
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

