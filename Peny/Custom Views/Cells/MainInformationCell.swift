//
//  HeaderCollectionViewCell.swift
//  Peny
//
//  Created by Yelena Gorelova on 14.11.2023.
//

import UIKit
import SnapKit

class MainInformationCell: UICollectionViewCell {

  static let identifier = "MainInfoCell"
  let labelMainInfo = PetLabel(text: "Main Information", font: UIFont.systemFont(ofSize: 14))


  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(labelMainInfo)

    labelMainInfo.translatesAutoresizingMaskIntoConstraints = false
    labelMainInfo.textColor = #colorLiteral(red: 0.5082387328, green: 0.5382179022, blue: 0.5890793204, alpha: 1)

    labelMainInfo.snp.makeConstraints { make in
      make.height.equalToSuperview()
      make.leading.equalToSuperview().offset(-240)
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview().offset(-10)
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}



