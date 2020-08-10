//
//  ExchangeService.swift
//  CurrencyConverter
//
//  Created by MacBook on 07/07/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

protocol ExchangeServiceProtocol {
    func getExchange(fromCurrency: String, toCurrency: String, completion: @escaping ((Result<ExchangeModel, Error>) -> Void))
}

class ExchangeService: ExchangeServiceProtocol {


    func getExchange(fromCurrency: String, toCurrency: String, completion: @escaping ((Result<ExchangeModel, Error>) -> Void)) {
        
        let headers = [
            "x-rapidapi-host": "currency-converter5.p.rapidapi.com",
            "x-rapidapi-key": "5c120eaad7msh654deae5bb75436p17b7e1jsn4021a19a4ddb"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://currency-converter5.p.rapidapi.com/currency/convert?format=json&from=\(fromCurrency)&to=\(toCurrency)&amount=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            print(data)
            guard
            error == nil,
                let unwrappedData = data
            else {
                 completion(.failure(error ?? NSError()))
                return
            }
            do {
                let exchange = try JSONDecoder().decode(ExchangeModel.self, from: unwrappedData)
                completion(.success(exchange))
            } catch {
                print(error)
                completion(.failure(error ?? NSError()))
            }
        })

        dataTask.resume()
    }
    
}
