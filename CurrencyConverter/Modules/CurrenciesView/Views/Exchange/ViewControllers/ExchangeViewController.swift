//
//  ExchangeViewController.swift
//  CurrencyConverter
//
//  Created by MacBook on 07/07/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ExchangeViewController: UIViewController {
    
    private let viewModel: ExchangeViewModel
    
    init(with viewModel: ExchangeViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func loadView() {
        super.loadView()
        view = ExchangeView(with: viewModel)
    }
    
}
