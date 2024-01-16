//
//  ViewController.swift
//  Peny
//
//  Created by Yelena Gorelova on 10.10.2023.
//

import SnapKit
import UIKit

class PetLoginVC: UIViewController, FlowController {
  var completionHandler: ((String?) -> ())?

  private let illustrationImageView = UIImageView()
  private let petImageView = UIImageView()
  private let rectangleImageView = UIImageView()
  private let petFieldsView = PetFieldsView()
  private let callToActionButton = PetButton(backgroundColor: .systemBlue, title: "Next")
  private let restoreButton = PetLoginButtons(title: "Restore password")
  private let lineImage = UIImageView()
  private let registerButton = PetLoginButtons(title: "Register")

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBlue

    configImageIllustration()
    configImageIllustrationPet()
    configImageRectangle()
    configPetFieldsView()
    configNextButton()
    configureLoginStack()
    setupKeyboardHiding()
  }


  private lazy var loginStack: UIStackView = {
    $0.axis = .horizontal
    $0.alignment = .fill
    $0.distribution = .fillProportionally
    $0.spacing = 30
    lineImage.image = UIImage(named: "Line 3")!
    $0.translatesAutoresizingMaskIntoConstraints = false

    return $0
  }(UIStackView(arrangedSubviews: [restoreButton, lineImage,registerButton]))


  private func configImageIllustration() {

    view.addSubview(illustrationImageView)
    illustrationImageView.translatesAutoresizingMaskIntoConstraints = false
    illustrationImageView.image = UIImage(named: "Illustration")!

    illustrationImageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.top.equalToSuperview()

    }
  }

  private func configImageIllustrationPet() {
    view.addSubview(petImageView)

    petImageView.translatesAutoresizingMaskIntoConstraints = false
    petImageView.image = UIImage(named: "IllustrationPet")!

    petImageView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(180)
      make.bottom.equalTo(illustrationImageView.safeAreaLayoutGuide.snp.bottom).offset(-175)
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(120)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-120)
    }
  }


  private func configImageRectangle() {
    view.addSubview(rectangleImageView)
    rectangleImageView.translatesAutoresizingMaskIntoConstraints = false
    rectangleImageView.image = UIImage(named: "Rectangle 150")!

    rectangleImageView.snp.makeConstraints { make in
      make.bottom.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.top.equalTo(petImageView.safeAreaLayoutGuide.snp.bottom).offset(5)
    }
  }


  private func configPetFieldsView() {
    view.addSubview(petFieldsView)

    petFieldsView.snp.makeConstraints { make in
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(15)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-15)
      make.top.equalTo(rectangleImageView.safeAreaLayoutGuide.snp.top).offset(7)
    }
  }


  private func configNextButton() {
    view.addSubview(callToActionButton)
    callToActionButton.layer.cornerRadius = 25

    callToActionButton.snp.makeConstraints { make in
      make.top.equalTo(petFieldsView.safeAreaLayoutGuide.snp.bottom).offset(10)
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(25)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-25)
      make.height.equalTo(50)
    }
  }


  private func configureLoginStack() {
    view.addSubview(loginStack)
    restoreButton.addTarget(self, action: #selector(restorePasswordButton), for: .touchUpInside)
    registerButton.addTarget(self, action: #selector(registrationButton), for: .touchUpInside)

    loginStack.snp.makeConstraints { make in
      make.top.equalTo(callToActionButton.safeAreaLayoutGuide.snp.bottom).offset(10)
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-70)
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-2)
    }
  }


  @objc private func restorePasswordButton() {
    completionHandler?("true")
  }

  @objc private func registrationButton() {
    completionHandler?("true")
  }


  private func setupKeyboardHiding() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
}


extension PetLoginVC {
  @objc func keyboardWillShow(sender: NSNotification) {
    view.frame.origin.y = view.frame.origin.y - 330
  }


  @objc func keyboardWillHide(sender: NSNotification) {
    view.frame.origin.y = 0
  }
}






