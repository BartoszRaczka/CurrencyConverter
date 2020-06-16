//
//  CurrencyView.swift
//  CurrencyConverter
//
//  Created by MacBook on 08/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit

class CurrencyView: UIView {
    
    let viewModel: CurrencyViewModel
    
    init(with viewModel: CurrencyViewModel){
        self.viewModel = viewModel
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
