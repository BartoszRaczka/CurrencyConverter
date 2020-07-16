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
    
    var onCurrencySelected: ((String, CurrencyType) -> Void)?
    
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
    
    func showCurrencies(with currencies: CurrencyModel, currencyType: CurrencyType) {
        let collectionViewModel = CollectionViewModel(currencyModel: currencies, currencyType: currencyType, coordinator: self)
        let viewModel = CurrencyViewModel(currencies: currencies, collectionViewModel: collectionViewModel)
        let viewController = CurrencyViewController(with: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showExchange(with rates: ExchangeModel) {
        let viewModel = ExchangeViewModel(exchange: rates)
        let viewController = ExchangeViewController(with: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func didSelectCurrency(_ currency: String, currencyType: CurrencyType) {
        navigationController.popViewController(animated: true)
        onCurrencySelected?(currency, currencyType)
    }
}
