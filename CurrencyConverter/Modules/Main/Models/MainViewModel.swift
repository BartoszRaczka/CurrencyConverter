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
    private let currencyService: CurrencyService

    init(coordinator: Coordinator, currencyService: CurrencyService) {
        self.coordinator = coordinator
        self.currencyService = currencyService
    }
}
