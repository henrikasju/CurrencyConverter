//
//  Visitable.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 19/01/2021.
//

import Foundation

protocol Visitable {
  func accept(visitor: TaxVisitor)
}
