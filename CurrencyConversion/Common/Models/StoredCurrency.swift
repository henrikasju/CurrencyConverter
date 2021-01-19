//
//  StoredCurrency.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 18/01/2021.
//

import Foundation
import RealmSwift

class StoredCurrency: Object {
  @objc dynamic var name: String = ""
  @objc dynamic var holdingAmount: Double = 0.0

  override class func primaryKey() -> String? {
    "name"
  }
}
