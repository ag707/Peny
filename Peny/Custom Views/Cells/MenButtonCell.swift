//
//  MenButtonCell.swift
//  Peny
//
//  Created by Yelena Gorelova on 23.11.2023.
//

import UIKit
import SnapKit

protocol CollectionViewCellDelegate: AnyObject {
    func didTapButton()
}

class MenButtonCell: UICollectionViewCell {

  weak var delegate: CollectionViewCellDelegate?

  static let headerIdentifier = "MenButtonCell"

  let callToActionButton = PetButton(backgroundColor: .systemBlue, title: "Next")

  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc private func buttonTapped(_ sender: UIButton) {
          delegate?.didTapButton()
      }

}

extension MenButtonCell {
  func style() {

    callToActionButton.layer.cornerRadius = 25
    callToActionButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

  }

  func layout() {

    addSubview(callToActionButton)

    callToActionButton.snp.makeConstraints { make in
      make.height.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview().offset(20)
    }
  }
}
