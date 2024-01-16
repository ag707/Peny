//
//  ButtonCell.swift
//  Peny
//
//  Created by Yelena Gorelova on 23.11.2023.
//

import UIKit
import SnapKit

class PetButtonCell: UICollectionViewCell {

  static let headerIdentifier = "ButtonCell"

  let callToActionButton = PetButton(backgroundColor: .systemBlue, title: "Create")

  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension PetButtonCell {
  func style() {
    
    callToActionButton.layer.cornerRadius = 25
  }

  func layout() {

    addSubview(callToActionButton)
    
    callToActionButton.snp.makeConstraints { make in
      make.height.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview().offset(20)
    }
  }
}
