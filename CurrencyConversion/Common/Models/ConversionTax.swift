//
//  ConversionTax.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 19/01/2021.
//

import Foundation

class ConversionTax: Tax {
  var rate: Double

  init(rate: Double) {
    self.rate = rate
  }

  func accept(visitor: TaxVisitor) {
    visitor.visit(tax: self)
  }
}
