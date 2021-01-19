//
//  CurrencyConverterView.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 09/01/2021.
//

import UIKit
import Stevia

protocol CurrencyConverterViewDelegate {

}

class CurrencyConverterView: UIView {

  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
  let submitButton = UIButton()

  let localFont = UIFont.systemFont(ofSize: 18, weight: .medium)
  let localFontColor = UIColor(named: "backgroundColor")

  convenience init() {
    self.init(frame: .zero)

    backgroundColor = UIColor(named: "backgroundColor")

    subviews (
      collectionView,
      submitButton
    )

    submitButton.setTitle("SUBMIT", for: .normal)
    submitButton.titleLabel?.font = localFont
    submitButton.setTitleColor(localFontColor, for: .normal)
    submitButton.backgroundColor = UIColor(named: "secondaryColor")
    submitButton.left(12).right(12)
    submitButton.height(50)
    submitButton.Bottom == safeAreaLayoutGuide.Bottom
    submitButton.layer.cornerRadius = 25

    collectionView.Left == Left
    collectionView.Right == Right
    collectionView.Top == Top
    collectionView.Bottom == submitButton.Top - 12

    collectionView.backgroundColor = .cyan
    collectionView.showsVerticalScrollIndicator = false
  }

}
