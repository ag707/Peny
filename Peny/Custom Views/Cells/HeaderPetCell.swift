//
//  HeaderCollectionViewCell.swift
//  Peny
//
//  Created by Yelena Gorelova on 14.11.2023.
//

import UIKit
import SnapKit

protocol HeaderPetCellDelegate: AnyObject {
    func popTapButton()
}

class HeaderPetCell: UICollectionViewCell {

  weak var delegate: HeaderPetCellDelegate?

  static let headerIdentifier = "HeaderCell"

  let blueRectangleImageView = UIImageView()
  let navButton = PetButton()
  let navButtonImage = UIImage(named: "arrowNav")
  let avatarImageView = UIImageView()
  let labelDownload = PetLabel(text: "Download photo", font: UIFont.systemFont(ofSize: 16))
  let buttonsStack = UIStackView()
  let menButton = PetButton()
  let womenButton = PetButton()
  let imageMen = UIImage(named: "boyPet")
  let imageWomen = UIImage(named: "girlPet")

  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc func buttonTapped(_ sender: UIButton) {
          delegate?.popTapButton()
      }
}

extension HeaderPetCell {

  func style() {

    blueRectangleImageView.translatesAutoresizingMaskIntoConstraints = false
    blueRectangleImageView.image = UIImage(named: "RectangleBlue")!

    navButton.translatesAutoresizingMaskIntoConstraints = false
    navButton.setImage(navButtonImage, for: .normal)
    navButton.sizeToFit()
    navButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    avatarImageView.image = UIImage(named: "avatarPet")!

    labelDownload.translatesAutoresizingMaskIntoConstraints = false
    labelDownload.textColor = #colorLiteral(red: 0.210881561, green: 0.524502635, blue: 1, alpha: 1)

    buttonsStack.translatesAutoresizingMaskIntoConstraints = false
    buttonsStack.axis = .horizontal
    buttonsStack.alignment = .fill
    buttonsStack.distribution = .fillEqually
    buttonsStack.spacing = 5

    menButton.setImage(imageMen, for: .normal)
    womenButton.setImage(imageWomen, for: .normal)
  }


  func layout() {

    addSubview(blueRectangleImageView)
    addSubview(avatarImageView)
    addSubview(navButton)
    addSubview(labelDownload)
    buttonsStack.addArrangedSubview(menButton)
    buttonsStack.addArrangedSubview(womenButton)
    addSubview(buttonsStack)
    

    
    blueRectangleImageView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.height.equalTo(140)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()

    }

    avatarImageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.height.equalTo(120)
      make.width.equalTo(120)
      make.bottom.equalTo(blueRectangleImageView.safeAreaLayoutGuide.snp.bottom).offset(30)
    }

    navButton.snp.makeConstraints { make in
      make.top.equalTo(avatarImageView.snp.top).offset(0)
      make.leading.equalToSuperview().offset(30)
      make.width.equalTo(34)
      make.height.equalTo(34)
    }

    labelDownload.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(avatarImageView.safeAreaLayoutGuide.snp.bottom).offset(15)
      make.width.equalTo(102)
    }

    buttonsStack.snp.makeConstraints { make in
      make.top.equalTo(labelDownload.safeAreaLayoutGuide.snp.bottom).offset(20)
      make.leading.equalToSuperview().offset(25)
      make.trailing.equalToSuperview().offset(-25)
      make.height.equalTo(45)
    }
  }
}
