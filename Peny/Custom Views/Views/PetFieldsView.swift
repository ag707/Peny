//
//  PetFieldsView.swift
//  Peny
//
//  Created by Yelena Gorelova on 14.10.2023.
//

import UIKit
import SnapKit

class PetFieldsView: UIView {

  private let stackView = UIStackView()
  let entryLabel = PetLabel(text: "Entry", font: UIFont.systemFont(ofSize: 25))
  let emailTextField = PetLabelTextFieldView()
  let passwordTextField = PetLabelTextFieldView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension PetFieldsView {

  func style()  {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = UIColor.clear

    entryLabel.translatesAutoresizingMaskIntoConstraints = false

    emailTextField.translatesAutoresizingMaskIntoConstraints = false
    
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    passwordTextField.customTextLabel.text = "Password"
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 8
  }


  func layout() {
    stackView.addArrangedSubview(entryLabel)
    stackView.addArrangedSubview(emailTextField)
    stackView.addArrangedSubview(passwordTextField)

    addSubview(stackView)

    emailTextField.snp.makeConstraints { make in
      make.height.equalTo(55)
    }

    passwordTextField.snp.makeConstraints { make in
      make.height.equalTo(55)
    }

    stackView.snp.makeConstraints { make in
      make.bottom.equalTo(-6)
      make.leading.equalTo(12)
      make.trailing.equalTo(-12)
      make.top.equalTo(6)

    }
  }
}
