//
//  ExchangeView.swift
//  CurrencyConverter
//
//  Created by MacBook on 07/07/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ExchangeView: UIView {
    
    let viewModel: ExchangeViewModel
    
    var exchangeLabel: UILabel!
    
    init(with viewModel: ExchangeViewModel){
    self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupExchangeLabel() {
        exchangeLabel = UILabel()
        addSubview(exchangeLabel)
        
        exchangeLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
