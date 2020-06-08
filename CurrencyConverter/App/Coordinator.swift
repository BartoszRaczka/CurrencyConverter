//
//  Coordinator.swift
//  CurrencyConverter
//
//  Created by MacBook on 05/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

final class Coordinator {
    
    private let window: UIWindow
    private var navigationController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewModel = MainViewModel(
            coordinator: self,
            currencyService: CurrencyService()
        )
        let viewController = MainViewController(with: viewModel)
        
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showCurrencies(with currencies: CurrencyModel) {
        let viewModel = CurrencyViewModel(currencies: currencies)
        let viewController = CurrencyViewController(with: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
