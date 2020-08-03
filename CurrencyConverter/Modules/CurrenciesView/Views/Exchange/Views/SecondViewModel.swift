//
//  SecondViewModel.swift
//  CurrencyConverter
//
//  Created by MacBook on 13/07/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

class SecondViewModel {
    
    private let coordinator: Coordinator
    private let exchangeService: ExchangeServiceProtocol
    
    init(coordinator: Coordinator, exchangeService: ExchangeServiceProtocol) {
        self.coordinator = coordinator
        self.exchangeService = exchangeService
    }
    
    func showExchange() {
        exchangeService.getExchange(fromCurrency: "USD", toCurrency: "PLN") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let exchange):
                    self?.coordinator.showExchange(with: exchange)
                    
                case .failure:
                    print("Failed a retrive an exchange")
                }
            }
        }
    }
}
