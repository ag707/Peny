//
//  PetLabelTextFieldView.swift
//  Peny
//
//  Created by Yelena Gorelova on 24.10.2023.
//

import UIKit
import SnapKit

class PetLabelTextFieldView: UIView, UITextFieldDelegate{

   let customTextLabel = PetLabel(text: "Email", font: UIFont.systemFont(ofSize: 14))
   let customTextField = UITextField()
   let customStackView = UIStackView()


  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }


  @objc func handleTap() {

    if let text = customTextField.text, text.isEmpty {

      customTextField.becomeFirstResponder()
      customTextField.isHidden = false

    }
  }


  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

    return true
  }

  internal func textFieldDidEndEditing(_ textField: UITextField)  {
    if customTextField.text?.isEmpty ?? true {
                // Hide the text field if it's empty
                textField.isHidden = true
            }

  }


  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension PetLabelTextFieldView {

  func style() {

    backgroundColor = UIColor.white
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = 10
    clipsToBounds = true
    layer.borderWidth = 1
    layer.borderColor = UIColor.systemGray4.cgColor
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
      addGestureRecognizer(tapGestureRecognizer)


    customTextLabel.textColor = .gray
    customTextLabel.textAlignment = .natural

    customTextField.translatesAutoresizingMaskIntoConstraints = false
    customTextField.layer.cornerRadius = 10
    customTextField.layer.borderWidth = 1
    customTextField.layer.borderColor = UIColor.clear.cgColor
    customTextField.textColor = .label
    customTextField.tintColor = .label
    customTextField.textAlignment = .left
    customTextField.font = UIFont.preferredFont(forTextStyle: .body)
    customTextField.adjustsFontSizeToFitWidth  = true
    customTextField.minimumFontSize  = 6
    customTextField.backgroundColor = .clear
    customTextField.autocorrectionType = .no
    customTextField.returnKeyType = .go
    customTextField.delegate = self
    customTextField.isHidden = true

    customStackView.translatesAutoresizingMaskIntoConstraints = false
    customStackView.axis = .vertical

  }


  func layout() {

    customStackView.addArrangedSubview(customTextLabel)
    customStackView.addArrangedSubview(customTextField)
    addSubview(customStackView)

    customStackView.snp.makeConstraints { make in
    make.bottom.equalTo(-6)
    make.leading.equalTo(12)
    make.trailing.equalTo(-12)
    make.top.equalTo(6)
    }
  }
}
