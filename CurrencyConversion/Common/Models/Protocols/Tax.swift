//
//  Tax.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 19/01/2021.
//

import Foundation

protocol Tax: Visitable {
  var rate: Double { get set }
}
