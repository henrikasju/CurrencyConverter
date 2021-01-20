//
//  SceneDelegate.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 09/01/2021.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  var container = Container()

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = UIWindow(windowScene: windowScene)
    registerDependencies()
    initialLaunchSetup()

    let vc = container.resolve(CurrencyConverterViewController.self)!
    let rootVC = UINavigationController(rootViewController: vc)

    window?.rootViewController = rootVC
    setupNavigationBarAppearance()
    window?.makeKeyAndVisible()
  }

  private func initialLaunchSetup() {
    let defaults = UserDefaults.standard
    let databaseWorker = container.resolve(DatabaseWorker.self)

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

      databaseWorker?.addStoredCurrencies(objects: [euros, dollars, yens]) { error in
        fatalError("Issues with database!, \(String(describing: error?.localizedDescription))")
      }
      defaults.set(true, forKey: "launchedBefore")
    }
  }

  private func registerDependencies() {
    container.register(CurrencyConversionWorker.self) { _ in
      CurrencyConversionWorker()
    }
    container.register(DatabaseWorker.self) { _ in
      DatabaseWorker()
    }
    container.register(CurrencyConverterPresenter.self) { _ in CurrencyConverterPresenter() }
      .initCompleted { resolver, presenter in
        presenter.viewController = resolver.resolve(CurrencyConverterViewController.self)
      }
    container.register(CurrencyConverterInteractor.self) { resolver in
      let currencyConversionWorker = resolver.resolve(CurrencyConversionWorker.self)!
      let databaseWorker = resolver.resolve(DatabaseWorker.self)!
      let presenter = resolver.resolve(CurrencyConverterPresenter.self)!

      return CurrencyConverterInteractor(presenter: presenter, currencyConversionWorker: currencyConversionWorker, databaseWorker: databaseWorker)
    }
    container.register(CurrencyConverterViewController.self) { resolver in
      let vc = CurrencyConverterViewController()
      vc.interactor = resolver.resolve(CurrencyConverterInteractor.self)

      return vc
    }
  }

  func setupNavigationBarAppearance() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(named: "secondaryColor")
    appearance.titleTextAttributes = [
      .foregroundColor: UIColor.white,
      .font: UIFont.systemFont(ofSize: 17, weight: .medium)
    ]

    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
  }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

