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

    init(coordinator: Coordinator, currencyService: CurrencyServiceProtocol) {
        self.coordinator = coordinator
        self.currencyService = currencyService
    }
    
//    func showCurrencies() {
//        currencyService.showCurrencies { [weak self] result in
//                DispatchQueue.main.async {
//                    switch result {
//                    case .success(let joke):
//                        self?.coordinator.showCurrencies(with: currencies)
//
//                    case .failure:
//                        print("Failed to retrieve a currencies")
//                    }
//                    self?.onShowLoader?(false)
//                }
//            }
//    }
//
}
