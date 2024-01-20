//
//  PetRestorePasswordVC.swift
//  Peny
//
//  Created by Yelena Gorelova on 14.10.2023.
//

import UIKit
import SnapKit

class PetRestorePasswordVC: UIViewController {

  var viewModel : LoginViewModel!

  let remindLable = PetLabel(text: "Remind Password", font: UIFont.systemFont(ofSize: 29))
  let imageLine = UIImageView()
  let emailField = PetLabelTextFieldView()
  let labelInstructions = PetLabelInstructions(text: "Please provide the email address you used to log into Petapp so that we can remind you of your password.")
  let sentButton = PetButton(backgroundColor: .systemBlue, title: "Sent password")
  let arrowImage = UIImage(named: "Arrow")


  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    configNavStack()
    configImageLine()
    configEmailField()
    configlabelInstructions()
    configSentButton()
  }

  override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  private lazy var navButton: UIButton = {
     let b = UIButton()
    
    b.translatesAutoresizingMaskIntoConstraints = false
    b.addTarget(self, action:#selector(self.buttonAction), for: .touchUpInside)
    b.clipsToBounds = true
     return b
  }()

  private lazy var navStack: UIStackView = {
      $0.axis = .horizontal
      $0.alignment = .fill
      $0.distribution = .fillProportionally
      $0.spacing = 5
      $0.translatesAutoresizingMaskIntoConstraints = false

      return $0
      }(UIStackView(arrangedSubviews: [navButton, remindLable]))


  private func configNavStack() {
      view.addSubview(navStack)
//      navButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
      navButton.setImage(arrowImage, for: .normal)

      navStack.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-30)
      make.height.equalTo(34)
    }
  }


  private func configImageLine() {
      view.addSubview(imageLine)
      imageLine.image = UIImage(named: "seperator")!

      imageLine.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
  }


  private func configEmailField() {
      view.addSubview(emailField)

      emailField.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
      make.height.equalTo(60)
    }
  }



  private func configlabelInstructions() {
      view.addSubview(labelInstructions)

      labelInstructions.snp.makeConstraints { make in
      make.top.equalTo(emailField.safeAreaLayoutGuide.snp.bottom).offset(5)
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(21)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-21)
      make.height.equalTo(36)
    }
  }


  private func configSentButton() {
      view.addSubview(sentButton)
      sentButton.layer.cornerRadius = 31
      sentButton.addTarget(self, action: #selector(didPressNextButton), for: .touchUpInside)

      sentButton.snp.makeConstraints { make in
      make.top.equalTo(labelInstructions.safeAreaLayoutGuide.snp.bottom).offset(18)
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(100)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-100)
      make.height.equalTo(60)
    }
  }

  @objc func buttonAction() {
    _ = PetLoginVC()
    navigationController?.popViewController(animated: true)
  }

  @objc private func didPressNextButton() {
//    viewModel.goToLogin()
  }
}



