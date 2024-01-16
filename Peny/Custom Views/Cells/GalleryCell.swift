//
//  GalleryCell.swift
//  Peny
//
//  Created by Yelena Gorelova on 28.11.2023.
//

import UIKit
import SnapKit

protocol SentImageDataDelegate {
  func sentData(image: Data)
}


class GalleryCell: UICollectionViewCell {

  var imageViewArray: [Data] = []

  static let headerIdentifier = "GalleryCell"

  weak var delegate: CellActionDelegate?
  var sentDataDelegateImage: SentImageDataDelegate?

  var collectionView: UICollectionView!
  let layout = UICollectionViewFlowLayout()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)


    configCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  private func configCollectionView() {

    //    collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), collectionViewLayout: layout)
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    layout.scrollDirection = .horizontal
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.register(LoadImageCell.self, forCellWithReuseIdentifier: "LoadImageCell")
    collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
    collectionView.dataSource = self
    collectionView.delegate = self
    
    
    addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }
}

extension GalleryCell: SentImageDataDelegate {
  func sentData(image: Data) {
    imageViewArray.append(image)
    collectionView.reloadData()
  }
}


extension GalleryCell: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: 100)

  }
}

extension GalleryCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageViewArray.isEmpty ? 5 : imageViewArray.count + 1
    //    return imageViewArray.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    if imageViewArray.isEmpty {

      //kogda net kartinok
      switch indexPath.row {
      case 0 :
        let loadImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoadImageCell", for: indexPath) as! LoadImageCell
        loadImageCell.delegate = delegate
        return loadImageCell

      case 1...5 :
        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell

        

        return imageCell

      default:
        return UICollectionViewCell()
      }

    } else {
      // kogda est' kartinki
      switch indexPath.row {
      case  0...imageViewArray.count - 1 :
        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        imageCell.showImage(data: imageViewArray[indexPath.row])
        return imageCell
        //kartinka
      default:
        let loadImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoadImageCell", for: indexPath) as! LoadImageCell
        loadImageCell.delegate = delegate
        return loadImageCell
      }
    }
  }
}



