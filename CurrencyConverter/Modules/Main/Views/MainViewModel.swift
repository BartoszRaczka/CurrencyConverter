//
//  MainViewModel.swift
//  CurrencyConverter
//
//  Created by MacBook on 05/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

class MainViewModel {
    
    private let coordinator: Coordinator
    private let currencyService: CurrencyServiceProtocol
    
    var fromCurrency: String?
    var toCurrency: String?
    
    var onButtonTapped: (() -> Void)?
    
    var onShowLoader: ((Bool) -> Void)?

    init(coordinator: Coordinator, currencyService: CurrencyServiceProtocol) {
        self.coordinator = coordinator
        self.currencyService = currencyService
        bindActions()
    }
    
    func showCurrencies() {
        onShowLoader?(true)
        
        currencyService.getCurrencies { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let currencies):
                        self?.coordinator.showCurrencies(with: currencies)

                    case .failure:
                        print("Failed to retrieve a currencies")
                    }
                    self?.onShowLoader?(false)
                }
            }
    }
    
    private func bindActions() {
        coordinator.onCurrencySelected = { [weak self] currency, currencyType in
            switch currencyType {
            case .from:
                self?.fromCurrency = currency
            case .to:
                self?.toCurrency = currency
            }
        }
    }

}
