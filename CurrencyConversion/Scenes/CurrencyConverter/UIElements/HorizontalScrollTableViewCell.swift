//
//  HorizontalScrollTableViewCell.swift
//  CurrencyConversion
//
//  Created by Henrikas J on 09/01/2021.
//

import UIKit

class HorizontalScrollTableViewCell: UITableViewCell {

  let collectionView = UICollectionView()

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    subviews {
      collectionView
    }

    collectionView.fillContainer()
  }

}
