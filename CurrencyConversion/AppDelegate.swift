//
//  AppDelegate.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 09/01/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

      let defaults = UserDefaults.standard
      let databaseWorker = DatabaseWorker()

      let launchedBefore = defaults.bool(forKey: "launchedBefore")
      if !launchedBefore {

        let euros: StoredCurrency = {
          let currency = StoredCurrency()
          currency.name = "EUR"
          currency.holdingAmount = 1000
          return currency
        }()

        let dollars: StoredCurrency = {
          let currency = StoredCurrency()
          currency.name = "USD"
          currency.holdingAmount = 0
          return currency
        }()

        let yens: StoredCurrency = {
          let currency = StoredCurrency()
          currency.name = "JPY"
          currency.holdingAmount = 0
          return currency
        }()

        databaseWorker.addStoredCurrencies(objects: [euros, dollars, yens]) { error in
          fatalError("Issues with database!, \(String(describing: error?.localizedDescription))")
        }
        defaults.set(true, forKey: "launchedBefore")
      }

      return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

