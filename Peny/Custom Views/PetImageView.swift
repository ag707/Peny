//
//  PetImageView.swift
//  Peny
//
//  Created by Yelena Gorelova on 13.10.2023.
//

import UIKit

class PetImageView: UIImageView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  init(name: UIImage) {
      super.init(frame: .zero)

    self.image = name
      configure()
  }


  private func configure() {


    translatesAutoresizingMaskIntoConstraints = false
  }

}
