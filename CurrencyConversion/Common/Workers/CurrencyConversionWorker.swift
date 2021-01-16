//
//  CurrencyConversionWorker.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 12/01/2021.
//

import Foundation
import Alamofire

final class CurrencyConversionWorker {

  typealias NetworkRequestCompletionHandler = ((DataResponse<ConvertedCurrency, AFError>) -> Void)

  func fetchConvertedCurrency(fromAmount: String,
                              fromCurrency: String,
                              toCurrency: String,
                              completion: @escaping NetworkRequestCompletionHandler) {

    if let url = URL(string: "http://api.evp.lt/currency/commercial/exchange/\(fromAmount)-\(fromCurrency)/\(toCurrency)/latest"){
      AF.request(url)
        .validate()
        .validate(contentType: ["application/json"])
        .responseDecodable(of: ConvertedCurrency.self, completionHandler: completion)
    }
  }

}
