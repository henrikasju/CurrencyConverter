//
//  TitleHeaderCollectionReusableView.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 10/01/2021.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {

  class var identifier: String{
      return "TitleHeaderCollectionReusableView"
  }

  let localFont = UIFont.systemFont(ofSize: 14, weight: .medium)
  let localFontColor = UIColor(named: "sectionTextColor")

  let titleLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)

    subviews(
      titleLabel
    )

    titleLabel.top(24).bottom(10).left(0).right(0)
    titleLabel.backgroundColor = .clear
    titleLabel.font = localFont
    titleLabel.textColor = localFontColor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
