//
//  CollectionViewModel.swift
//  CurrencyConverter
//
//  Created by MacBook on 08/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

struct CollectionViewModel {
    
//    var currencies: [String]
    var customCellViewModels: [CustomCellViewModel]
    
    init(currencyModel: CurrencyModel) {
//        customCellViewModels = [CustomCellViewModel]()
//        currencies = currencyModel.currencies
//            .map { $0.key }
//            .sorted()
        
//        var newCurrencies = [String]()
//        currencyModel.currencies.forEach {
//            newCurrencies.append($0.key)
//
//        }

//        for currency in currencies {
//            let viewModel = CustomCellViewModel(title: currency)
//            customCellViewModels.append(viewModel)
//        }
        
        customCellViewModels = currencyModel.currencies
            .map { (key, value) in
                return value
//          .map { $0.value }
            }
            .sorted()
            .map { currency in
                return CustomCellViewModel(title: currency)
//          .map { CustomCellViewmodel(title: $0) }
            }
    }
    
}
