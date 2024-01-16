//
//  PetRegistrationVC.swift
//  Peny
//
//  Created by Yelena Gorelova on 19.10.2023.
//

import UIKit
import SnapKit

class RegistrationVC: UIViewController, FlowController, CollectionViewCellDelegate, HeaderMenCellDelegate {

  var completionHandler: ((String?) -> ())?

  let namesEachFieldData = ["Name", "Email", "Location", "Number", "About you", "Enter password", "Repeat password"]
  var collectionView: UICollectionView!
  let layout = UICollectionViewFlowLayout()


  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self

    collectionView.register(HeaderMenCell.self, forCellWithReuseIdentifier: "HeaderMenCell")
    collectionView.register(MainInformationCell.self, forCellWithReuseIdentifier: "MainInfoCell")
    collectionView.register(RegistrationCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.register(MenButtonCell.self, forCellWithReuseIdentifier: "MenButtonCell")

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
    collectionView.isScrollEnabled = false

    collectionView.snp.makeConstraints { make in
      make.top.equalTo(view)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }


  func didTapButton() {
    let petRegistarationVC = PetRegistarationVC()
    navigationController?.pushViewController(petRegistarationVC, animated: true)
  }

  func popTapButton() {
    _ = PetRestorePasswordVC()
    navigationController?.popViewController(animated: true)
  }


  @objc private func didPressNextButton() {
    completionHandler?("true")
  }
}

extension RegistrationVC: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    switch indexPath.row {
      
    case 0 : return CGSize(width: view.bounds.width, height: 300)

    case 1 : return CGSize(width: 151, height: 16)

    case 2...8 : return CGSize(width: 350, height: 45)

    case 9 : return CGSize(width: 350, height: 40)

    default:
      return CGSize()
    }
  }
}


extension RegistrationVC: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      switch indexPath.row {

      case 0 :
        let headerMenCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderMenCell", for: indexPath) as! HeaderMenCell
        headerMenCell.delegate = self
        return headerMenCell

      case 1 :
        let mainInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainInfoCell", for: indexPath) as! MainInformationCell
        return mainInfoCell

      case 2...8 :
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RegistrationCell
        cell.fieldView.customTextLabel.text = namesEachFieldData[indexPath.row - 2]
        return cell

      case 9 :
        let MenButtonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenButtonCell", for: indexPath) as! MenButtonCell
        MenButtonCell.delegate = self
        return MenButtonCell

      default:
        return UICollectionViewCell()
      }
    }
  }




