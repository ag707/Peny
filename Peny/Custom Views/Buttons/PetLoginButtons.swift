//
//  PetLoginButtons.swift
//  Peny
//
//  Created by Yelena Gorelova on 13.10.2023.
//

import UIKit

class PetLoginButtons: UIButton {

  override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
  }


  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }


  init(title: String) {
      super.init(frame: .zero)
      self.setTitle(title, for: .normal)
      configure()
  }

  private func configure() {

      setTitleColor(.gray, for: .normal)
      titleLabel?.font =  UIFont.systemFont(ofSize: 14)
      translatesAutoresizingMaskIntoConstraints = false
  }

}
