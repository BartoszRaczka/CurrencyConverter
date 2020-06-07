//
//  CurrencyService.swift
//  CurrencyConverter
//
//  Created by MacBook on 06/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

protocol CurrencyServiceProtocol {
    func getCurrencies(_ completion: @escaping ((Result<CurrencyModel, Error>) -> Void))
}

final class CurrencyService: CurrencyServiceProtocol {
    func getCurrencies(_ completion: @escaping ((Result<CurrencyModel, Error>) -> Void)) {
     
        let headers = [
            "x-rapidapi-host": "currency-converter5.p.rapidapi.com",
            "x-rapidapi-key": "5c120eaad7msh654deae5bb75436p17b7e1jsn4021a19a4ddb"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://currency-converter5.p.rapidapi.com/currency/list?format=json")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard
            error == nil,
                let data = data,
                let currencies = try? JSONDecoder().decode(CurrencyModel.self, from: data)
            else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(currencies))
        })

        dataTask.resume()
    }
    
}
