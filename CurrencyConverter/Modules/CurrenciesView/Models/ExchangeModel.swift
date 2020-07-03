//
//  ExchangeModel.swift
//  CurrencyConverter
//
//  Created by MacBook on 03/07/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

struct ExchangeModel: Codable {
    
    let rates: [String: String]
    
}
