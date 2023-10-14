//
//  ViewController.swift
//  Peny
//
//  Created by Yelena Gorelova on 10.10.2023.
//

import SnapKit
import UIKit

class ViewController: UIViewController {

  let callToActionButton = PetButton(backgroundColor: .systemBlue, title: "Next")
  let emailTextField = PetTextField(placeholder: "Email")
  let passwordTextField = PetTextField(placeholder: "Password")
  let entryLabel = PetLabel(text: "Entry", font: UIFont.systemFont(ofSize: 30))
  let rectangleImageView = PetImageView(name: UIImage(named: "Rectangle 150")!)
  let illustrationImageView = PetImageView(name: UIImage(named: "Illustration")!)
  let petImageView = PetImageView(name: UIImage(named: "IllustrationPet")!)
  let restoreButton = PetLoginButtons(title: "Restore password")
  let registerButton = PetLoginButtons(title: "Register")

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBlue

    configImageIllustration()
    configImageIllustrationPet()
    configImageRectangle()
    configureLabelEntry()
    configureSearchStack()
    configureLoginStack()
  }


  private lazy var loginStack: UIStackView = {
          $0.axis = .horizontal
          $0.alignment = .fill
          $0.distribution = .fillEqually
          $0.spacing = 20
    $0.translatesAutoresizingMaskIntoConstraints = false

          return $0
      }(UIStackView(arrangedSubviews: [restoreButton, registerButton]))


  private lazy var searchStack: UIStackView = {
          $0.axis = .vertical
          $0.alignment = .fill
          $0.distribution = .fillEqually
          $0.spacing = 20
    $0.translatesAutoresizingMaskIntoConstraints = false

          return $0
      }(UIStackView(arrangedSubviews: [emailTextField, passwordTextField, callToActionButton]))


  func configImageIllustration() {

      view.addSubview(illustrationImageView)

    illustrationImageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.top.equalToSuperview()

    }
  }

  func configImageIllustrationPet() {

      view.addSubview(petImageView)

    petImageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview()
      make.bottom.equalTo(illustrationImageView).offset(-100)

    }
  }


  func configImageRectangle() {

      view.addSubview(rectangleImageView)

    rectangleImageView.snp.makeConstraints { make in
      make.bottom.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.top.equalTo(petImageView.safeAreaLayoutGuide.snp.bottom).offset(10)


    }
  }


  func configureLabelEntry() {
    view.addSubview(entryLabel)

    entryLabel.snp.makeConstraints { make in
      make.top.equalTo(rectangleImageView).offset(15)
      make.centerX.equalToSuperview()
    }
  }


  func configureSearchStack() {

      view.addSubview(searchStack)

    searchStack.snp.makeConstraints { make in
      make.top.equalTo(entryLabel.safeAreaLayoutGuide.snp.bottom).offset(5)
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(15)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-15)
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)

    }
  }

  func configureLoginStack() {

      view.addSubview(loginStack)

    loginStack.snp.makeConstraints { make in
      make.top.equalTo(searchStack.safeAreaLayoutGuide.snp.bottom).offset(20)
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)

    }
  }

}







