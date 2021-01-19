//
//  ConvertedCurrencyTransaction.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 19/01/2021.
//

import Foundation
import RealmSwift

class ConvertedCurrencyTransaction: Object {
  @objc dynamic var fromCurrency: String?
  let fromAmount = RealmOptional<Double>()
  let fromTotalAmount = RealmOptional<Double>()
  let feeRate = RealmOptional<Double>()
  let feeAmount = RealmOptional<Double>()
  @objc dynamic var toCurrency: String?
  let toAmount = RealmOptional<Double>()
}
