//
//  DatabaseWorker.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 18/01/2021.
//

import Foundation
import RealmSwift

// TODO Should me as DatabaseManager!

final class DatabaseWorker {

  typealias DatabaseRequestCompletionHandler = (Error?) -> ()

  private var realm: Realm!

  init() {
    realm = try! Realm()
  }

  func addStoredCurrency(object: StoredCurrency, completion: DatabaseRequestCompletionHandler) {
    do {
      try realm.write {
        realm.add(object)
      }
    } catch {
      completion(error)
    }
  }

  func addStoredCurrencies(objects: [StoredCurrency], completion: DatabaseRequestCompletionHandler){
    do {
      try realm.write {
        realm.add(objects)
      }
    } catch {
      completion(error)
    }
  }

  func getAllStoredCurrencies() -> Results<StoredCurrency>? {
    let objects = realm.objects(StoredCurrency.self).sorted(byKeyPath: "holdingAmount", ascending: false)
    return objects
  }

  func getStoredCurrency(name: String) -> StoredCurrency? {
    let object = realm.object(ofType: StoredCurrency.self, forPrimaryKey: name)
    return object
  }

  func updateStoredCurrency(object: StoredCurrency, completion: DatabaseRequestCompletionHandler) {
    do {
      try realm.write {
        realm.add(object, update: .modified)
      }
    } catch {
      completion(error)
    }
  }

  func updateStoredCurrencies(objects: [StoredCurrency], completion: DatabaseRequestCompletionHandler) {
    do {
      try realm.write {
        realm.add(objects, update: .modified)
      }
    } catch {
      completion(error)
    }
  }

  func addConvertedCurrencyTransaction(object: ConvertedCurrencyTransaction, completion: DatabaseRequestCompletionHandler){
    do {
      try realm.write {
        realm.add(object)
      }
    } catch {
      completion(error)
    }
  }

  func addConvertedCurrencyTransaction(objects: [ConvertedCurrencyTransaction], completion: DatabaseRequestCompletionHandler) {
    do {
      try realm.write {
        realm.add(objects)
      }
    } catch {
      completion(error)
    }
  }

  func getAllConvertedCurrencyTransactions() -> Results<ConvertedCurrencyTransaction>? {
    let objects = realm.objects(ConvertedCurrencyTransaction.self)
    return objects
  }
}
