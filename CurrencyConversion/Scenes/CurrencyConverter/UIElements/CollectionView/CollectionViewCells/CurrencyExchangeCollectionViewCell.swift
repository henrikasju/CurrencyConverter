//
//  CurrencyExchangeCollectionViewCell.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 10/01/2021.
//

import UIKit
import Stevia

enum ExchangeCellType {
  case Sell
  case Receive
}

protocol CurrencyExchangeCollectionViewCellDelegate {
  func currencySelectionButtonPressed(_ cell: CurrencyExchangeCollectionViewCell, _ button: UIButton)
  func textFieldHasBeenEdited(_ cell: CurrencyExchangeCollectionViewCell, _ textField: UITextField, _ type: ExchangeCellType)
}

class CurrencyExchangeCollectionViewCell: UICollectionViewCell {

  class var identifier: String{
      return "CurrencyExchangeCollectionViewCell"
  }

  var type: ExchangeCellType!

  let actionImageView = UIImageView()
  let actionLabel = UILabel()
  let inputTextField = UITextField()
  let horizontalStackView = UIStackView()
  let currencySelectionButton = UIButton()
  var localFont = UIFont.systemFont(ofSize: 17, weight: .medium)
  var localFontColor = UIColor(named: "standardTextColor")
  var currencySelectionSymbolConfiguration = UIImage.SymbolConfiguration(weight: .medium)
  var borderColor = UIColor(named: "cellBorderColor")

  var viewModel: CurrencyConverter.CollectionView.ViewModel.CurrencyExchangeCell! {
    didSet {
      actionImageView.image = viewModel.image
      actionLabel.text = viewModel.title
      inputTextField.text = viewModel.value
      if let selectedCurrency = viewModel.selectedCurrency {
        currencySelectionButton.text(selectedCurrency)
      }
    }
  }

  var delegate: CurrencyExchangeCollectionViewCellDelegate?

  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = .clear

    let bottomBorderView = UIView()


    subviews{
      horizontalStackView
      bottomBorderView
    }

    horizontalStackView.addArrangedSubview(actionImageView)
    horizontalStackView.addArrangedSubview(actionLabel)
    horizontalStackView.addArrangedSubview(inputTextField)
    horizontalStackView.addArrangedSubview(currencySelectionButton)

    bottomBorderView.backgroundColor = borderColor
    bottomBorderView.height(1).right(-12)
    bottomBorderView.Left == actionLabel.Left
    
    horizontalStackView.axis = .horizontal
    horizontalStackView.alignment = .center
    horizontalStackView.distribution = .fill
    horizontalStackView.spacing = 12
    horizontalStackView.height(40)
    horizontalStackView.left(0).right(0).top(10)
    horizontalStackView.Bottom == bottomBorderView.Top + -10

    equal(heights: horizontalStackView, actionImageView, actionLabel, inputTextField, currencySelectionButton)

    actionImageView.backgroundColor = .clear
    actionImageView.heightEqualsWidth()
    let image = UIImage(named: "currencySellImage")
    actionImageView.image = image
    actionImageView.contentMode = .scaleToFill

    actionLabel.backgroundColor = .clear
    actionLabel.text("Sell")
    actionLabel.setContentHuggingPriority(.required, for: .horizontal)
    actionLabel.width(Int(frame.width/3))
    actionLabel.numberOfLines = 1
    actionLabel.font = localFont
    actionLabel.textColor = localFontColor

    inputTextField.backgroundColor = .clear
    inputTextField.text = "0.00"
    inputTextField.textAlignment = .right
    inputTextField.font = localFont
    inputTextField.textColor = localFontColor

    currencySelectionButton.width(80)
    currencySelectionButton.backgroundColor = .clear
    currencySelectionButton.text("EUR")
    currencySelectionButton.setImage(
      UIImage(systemName: "chevron.down",
              withConfiguration: currencySelectionSymbolConfiguration),
      for: .normal)
    currencySelectionButton.semanticContentAttribute = .forceRightToLeft
    currencySelectionButton.titleLabel?.font = localFont
    currencySelectionButton.tintColor = localFontColor
    currencySelectionButton.setTitleColor( localFontColor, for: .normal)
    currencySelectionButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -26)
    currencySelectionButton.imageEdgeInsets.left = 4

    currencySelectionButton.addTarget(self, action: #selector(currencySelectionButtonPressed(sender:)), for: .touchUpInside)
    inputTextField.addTarget(self, action: #selector(textFieldHasBeenEdited(sender:)), for: .editingChanged)
  }

  @objc func currencySelectionButtonPressed(sender: UIButton) {
    delegate?.currencySelectionButtonPressed(self, sender)
  }

  @objc func textFieldHasBeenEdited(sender: UITextField) {
    delegate?.textFieldHasBeenEdited(self, sender, self.type)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
}
