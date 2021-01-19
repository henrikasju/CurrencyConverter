//
//  FlatRateTaxVisitor.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 19/01/2021.
//

import Foundation

struct FlatRateTaxVisitor: TaxVisitor {
  func visit(tax: ConversionTax) {
    tax.rate = 0.07
  }
}
