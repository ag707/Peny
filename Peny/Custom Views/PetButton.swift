//
//  PetButton.swift
//  Peny
//
//  Created by Yelena Gorelova on 12.10.2023.
//

import UIKit

class PetButton: UIButton {

  override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
  }


  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }


  init(backgroundColor: UIColor, title: String) {
      super.init(frame: .zero)
      self.backgroundColor = backgroundColor
      self.setTitle(title, for: .normal)
      configure()
  }


  private func configure() {
      layer.cornerRadius      = 25
    clipsToBounds = true
    setTitleColor(.white, for: .normal)
      titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
      translatesAutoresizingMaskIntoConstraints = false
  }
}
