//
//  PetLabel.swift
//  Peny
//
//  Created by Yelena Gorelova on 13.10.2023.
//

import UIKit

class PetLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }


  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  init(text: String, font: UIFont) {
      super.init(frame: .zero)
      self.text = text
      self.font = font
      configure()
  }

  private func configure() {

    
    adjustsFontSizeToFitWidth = true
    lineBreakMode = .byWordWrapping
    translatesAutoresizingMaskIntoConstraints = false
    textAlignment = .center
  }

}
