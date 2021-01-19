//
//  Alert.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 12/01/2021.
//

import UIKit

struct Alert {

  typealias AlertActionHandler = (UIAlertAction) -> ()
  typealias AlertCompletionHandler = (() -> ())?

  static func showBasicAlert(on vc: UIViewController,
                                     title: String,
                                     message: String,
                                     leftButtonTitle: String,
                                     rightButttonTitle: String,
                                     leftButtonHandler: @escaping AlertActionHandler,
                                     rightButtonHandler: @escaping AlertActionHandler,
                                     completion: AlertCompletionHandler ) {

    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

    let leftButtonAction = UIAlertAction(title: leftButtonTitle, style: .cancel, handler: leftButtonHandler)

    let rightButtonAction = UIAlertAction(title: rightButttonTitle, style: .default, handler: rightButtonHandler)

    alert.addAction(leftButtonAction)
    alert.addAction(rightButtonAction)

    vc.present(alert, animated: true, completion: completion)
  }

  static func showSingleButtonAlert(on vc: UIViewController,
                                     title: String,
                                     message: String,
                                     buttonTitle: String,
                                     buttonHandler: AlertActionHandler?,
                                     completion: AlertCompletionHandler) {

    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

    let buttonAction = UIAlertAction(title: buttonTitle, style: .cancel, handler: buttonHandler)

    alert.addAction(buttonAction)

    vc.present(alert, animated: true, completion: completion)
  }
}
