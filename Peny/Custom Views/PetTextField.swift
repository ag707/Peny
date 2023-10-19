//
//  PetTextField.swift
//  Peny
//
//  Created by Yelena Gorelova on 12.10.2023.
//

import UIKit

class PetTextField: UITextField {


  private let padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 40)

  override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
  }

  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  init(placeholder: String) {
      super.init(frame: .zero)
      self.placeholder = placeholder
      configure()
  }

  override func textRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }

  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }

  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }


  private func configure() {
      translatesAutoresizingMaskIntoConstraints = false

      layer.cornerRadius = 10
      layer.borderWidth = 1
      layer.borderColor = UIColor.systemGray5.cgColor

      textColor = .label
      tintColor = .label
      textAlignment = .left
      font = UIFont.preferredFont(forTextStyle: .body)
      adjustsFontSizeToFitWidth  = true
      minimumFontSize  = 6

      backgroundColor = .tertiarySystemBackground
      autocorrectionType = .no
      returnKeyType = .go
  }
}
