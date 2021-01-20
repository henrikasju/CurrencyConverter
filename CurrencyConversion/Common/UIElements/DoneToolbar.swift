//
//  DoneToolbar.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 20/01/2021.
//

import UIKit

class DoneToolbar: UIToolbar {

  var doneButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
  let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

  override init(frame: CGRect) {
    super.init(frame: frame)

    sizeToFit()

    setItems([spacer, doneButton], animated: false)
    isUserInteractionEnabled = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
