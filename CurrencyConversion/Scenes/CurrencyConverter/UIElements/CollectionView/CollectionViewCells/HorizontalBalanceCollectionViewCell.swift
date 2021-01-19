//
//  HorizontalBalanceCollectionViewCell.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 09/01/2021.
//

import UIKit

class HorizontalBalanceCollectionViewCell: UICollectionViewCell {

  class var identifier: String{
      return "HorizontalBalanceCollectionViewCell"
  }

  var viewModel: CurrencyConverter.CollectionView.ViewModel.BalanceCell! {
    didSet {
      currencyLabel.text = viewModel.currencyName
      amountLabel.text = viewModel.holdingAmount
    }
  }

  let amountLabel = UILabel()
  let currencyLabel = UILabel()
  let horizontalStackView = UIStackView()

  let localFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
  let localFontColor = UIColor(named: "standardTextColor")

  override init(frame: CGRect) {
    super.init(frame: frame)

    subviews{
      horizontalStackView
    }

    horizontalStackView.addArrangedSubview(amountLabel)
    horizontalStackView.addArrangedSubview(currencyLabel)
    horizontalStackView.axis = .horizontal
    horizontalStackView.alignment = .center
    horizontalStackView.distribution = .fillProportionally
    horizontalStackView.spacing = 4
    horizontalStackView.fillContainer().centerInContainer()

    horizontalStackView.backgroundColor = .clear

    currencyLabel.text("EUR")
    currencyLabel.font = localFont
    currencyLabel.textColor = localFontColor
    currencyLabel.backgroundColor = .clear

    amountLabel.text("00.00")
    amountLabel.font = localFont
    amountLabel.textColor = localFontColor
    amountLabel.backgroundColor = .clear

    backgroundColor = .clear
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
