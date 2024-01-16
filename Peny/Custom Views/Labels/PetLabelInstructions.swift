//
//  PetLabelRestorePassword.swift
//  Peny
//
//  Created by Yelena Gorelova on 19.10.2023.
//

import UIKit

class PetLabelInstructions: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

//  , font: UIFont

  init(text: String) {
      super.init(frame: .zero)
      self.text = text
//      self.font = font
      configure()
  }


  private func configure() {

    adjustsFontSizeToFitWidth = true
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .gray
    textAlignment = .natural
    numberOfLines = 2
  }
}
