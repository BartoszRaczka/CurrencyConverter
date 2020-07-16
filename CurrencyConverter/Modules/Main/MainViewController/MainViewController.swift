//
//  MainViewController.swift
//  CurrencyConverter
//
//  Created by MacBook on 03/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    private let viewModel: MainViewModel
    
    init(with viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = MainView(with: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}

