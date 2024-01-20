//
//  PetRegistarationVC.swift
//  Peny
//
//  Created by Yelena Gorelova on 04.11.2023.
//

import UIKit
import SnapKit

class PetRegistarationVC: UIViewController, HeaderPetCellDelegate, CellActionDelegate{

  var viewModel : RegisterViewModel!

  var sentDataDelegate: SentImageDataDelegate?

  let namesEachFieldData = ["Pet breed", "Pet name", "Birthday", "Tell us about your pet"]
  var collectionView: UICollectionView!
  let layout = UICollectionViewFlowLayout()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self

    collectionView.register(HeaderPetCell.self, forCellWithReuseIdentifier: "HeaderCell")
    collectionView.register(MainInformationCell.self, forCellWithReuseIdentifier: "MainInfoCell")
    collectionView.register(RegistrationCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: "GalleryCell")
    collectionView.register(PetButtonCell.self, forCellWithReuseIdentifier: "ButtonCell")

    configCollectionView()
  }

  override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }


  private func configCollectionView() {
    view.addSubview(collectionView)

    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.showsVerticalScrollIndicator = true
    collectionView.allowsMultipleSelection = true
    collectionView.alwaysBounceVertical = true

    collectionView.snp.makeConstraints { make in
      make.top.leading.trailing.bottom.equalToSuperview()
    }
  }


  func popTapButton() {
    _ = RegistrationVC()
    navigationController?.popViewController(animated: true)
  }

  func showAlertFromCell() {
    let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

    let camera = UIAlertAction(title: "Camera", style: .default) { _ in
      self.chooseImagePicker(source: .camera)
    }

    let photo = UIAlertAction(title: "Photo", style: .default) { _ in
      self.chooseImagePicker(source: .photoLibrary)
    }

    let cancel = UIAlertAction(title: "Cancel", style: .cancel)

    actionSheet.addAction(camera)
    actionSheet.addAction(photo)
    actionSheet.addAction(cancel)

    present(actionSheet, animated: true)
  }


  @objc private func didPressNextButton() {
  }
}

extension PetRegistarationVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  func chooseImagePicker(source: UIImagePickerController.SourceType) {
    if UIImagePickerController.isSourceTypeAvailable(source) {
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.allowsEditing = true
      imagePicker.sourceType = source
      present(imagePicker, animated: true)
    }
  }


  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

    if let data = info [.editedImage] as? UIImage {

      if let imageData = data.jpegData(compressionQuality: 1.0) {
        processData(imageData)
      }
    }
    dismiss(animated: true, completion: nil)
  }
}

extension PetRegistarationVC {
  func processData(_ imageData: Data) {
    
    sentDataDelegate?.sentData(image: imageData)
  }
}


extension PetRegistarationVC: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    switch indexPath.row {
    case 0 : return CGSize(width: view.bounds.width, height: 300)
      
    case 1 : return CGSize(width: 151, height: 16)
      
    case 2...5 : return CGSize(width: 350, height: 55)

    case 6 : return CGSize(width: 350, height: 100)

    case 7 : return CGSize(width: 350, height: 55)
      
    default:
      return CGSize()
    }
  }
}


extension PetRegistarationVC: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 8
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch indexPath.row {

    case 0 :
      let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderPetCell
      headerCell.delegate = self
      return headerCell

    case 1 :
      let mainInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainInfoCell", for: indexPath) as! MainInformationCell
      return mainInfoCell

    case 2...5 :
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RegistrationCell
      cell.fieldView.customTextLabel.text = namesEachFieldData[indexPath.row - 2]
      return cell

    case 6 :
      let galleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
      galleryCell.delegate = self
      sentDataDelegate = galleryCell
      return galleryCell

    case 7 :
      let buttonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! PetButtonCell
      return buttonCell
      
    default:
      return UICollectionViewCell()
    }
  }
}

