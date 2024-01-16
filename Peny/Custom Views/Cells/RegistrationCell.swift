//
//  RegistrationCell.swift
//  Peny
//
//  Created by Yelena Gorelova on 03.11.2023.
//

import UIKit
import SnapKit

class RegistrationCell: UICollectionViewCell {


  var fieldView = PetLabelTextFieldView()
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(fieldView)

    fieldView.translatesAutoresizingMaskIntoConstraints = false

    fieldView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview()

      
    }
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
