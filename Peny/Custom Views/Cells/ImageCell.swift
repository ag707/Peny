//
//  ImageCell.swift
//  Peny
//
//  Created by Yelena Gorelova on 16.01.2024.
//

import UIKit
import SnapKit

class ImageCell: UICollectionViewCell {

  static let headerIdentifier = "ImageCell"

  let imageDownload = UIImageView()

  override init(frame: CGRect) {
    super.init(frame: frame)

    style()
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ImageCell {

  func showImage(data: Data) {
    imageDownload.image = UIImage(data: data)

  }

  func style() {

    imageDownload.translatesAutoresizingMaskIntoConstraints = false
    imageDownload.backgroundColor = #colorLiteral(red: 0.9529408813, green: 0.9529414773, blue: 0.9658513665, alpha: 1)

  }

  func layout() {

    addSubview(imageDownload)

    imageDownload.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }
}
