//
//  ToolbarPickerView.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 20/01/2021.
//

import UIKit
import Stevia

protocol ToolbarPickerViewDelegate {
  func toolbarPressedDone(_ pickerView: UIPickerView)
}

enum SelectionOwner {
  case Receive
  case Sell
}

class ToolbarPickerView: UIPickerView {

  public var selectionOwner: SelectionOwner?
  public var storingRowIndex: Int = 0

  public var toolbar: DoneToolbar!

  public var toolBarDelegate: ToolbarPickerViewDelegate!

  override init(frame: CGRect) {
    super.init(frame: frame)

    toolbar = DoneToolbar(frame: CGRect(x: 0, y: 0, width: 500, height: 50))

    toolbar.doneButton.target = self
    toolbar.doneButton.action = #selector(toolbarDoneButtonPressed(sender:))
  }

  @objc func toolbarDoneButtonPressed(sender: UIBarButtonItem) {
    toolBarDelegate?.toolbarPressedDone(self)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
