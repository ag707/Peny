//
//  ImagePickerCell.swift
//  Peny
//
//  Created by Yelena Gorelova on 27.11.2023.
//

import UIKit
import SnapKit

protocol CellActionDelegate: AnyObject {
    func showAlertFromCell()
}

class LoadImageCell: UICollectionViewCell {

  weak var delegate: CellActionDelegate?

  static let headerIdentifier = "LoadImageCell"

  let uploadImage = UIImageView()
  let downloadMediaButton = UIButton()
  let downloadStack = UIStackView()


  override init(frame: CGRect) {
    super.init(frame: frame)
    addDashedBorder()
    style()
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  private func addDashedBorder() {
          let shapeLayer = CAShapeLayer()
          shapeLayer.strokeColor = UIColor.systemGray4.cgColor
          shapeLayer.lineWidth = 1
          shapeLayer.lineDashPattern = [4, 4] // Customize the pattern as needed
          shapeLayer.frame = bounds
          shapeLayer.fillColor = nil
          shapeLayer.path = UIBezierPath(rect: bounds).cgPath
          layer.addSublayer(shapeLayer)
      }



    @objc private func buttonTapped(_ sender: UIButton) {
      delegate?.showAlertFromCell()
      }

}

extension LoadImageCell {
  func style() {

    uploadImage.translatesAutoresizingMaskIntoConstraints = false
    uploadImage.image = UIImage(named: "uploadArrow")!

    downloadMediaButton.translatesAutoresizingMaskIntoConstraints = false
    downloadMediaButton.layer.cornerRadius = 25
    downloadMediaButton.setTitle("Download\n    media", for: .normal)
    downloadMediaButton.titleLabel?.numberOfLines = 2
    downloadMediaButton.titleLabel?.lineBreakMode = .byTruncatingMiddle
    downloadMediaButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    downloadMediaButton.setTitleColor(#colorLiteral(red: 0.210881561, green: 0.524502635, blue: 1, alpha: 1), for: .normal)
  }

  func layout() {

    addSubview(uploadImage)
    addSubview(downloadMediaButton)

    uploadImage.snp.makeConstraints { make in
      make.height.equalTo(24)
      make.width.equalTo(24)
      make.centerX.equalToSuperview()
      make.bottom.equalTo(downloadMediaButton.snp.top).offset(-12)
    }

    downloadMediaButton.snp.makeConstraints { make in
      make.width.equalTo(85)
      make.height.equalTo(25)
      make.centerX.equalToSuperview()
      make.bottom.equalToSuperview().offset(-22)
    }
  }
}

