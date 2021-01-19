//
//  Visitor.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 19/01/2021.
//

import Foundation

protocol TaxVisitor {
  func visit(tax: ConversionTax)
}
