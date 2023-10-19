//
//  PetRestorePasswordVC.swift
//  Peny
//
//  Created by Yelena Gorelova on 14.10.2023.
//

import UIKit
import SnapKit

class PetRestorePasswordVC: UIViewController {


  private let loginView = PetFieldsView()

    override func viewDidLoad() {
        super.viewDidLoad()

      layout()
    }


}

extension PetRestorePasswordVC {
  private func layout() {

     view.addSubview(loginView)

        loginView.snp.makeConstraints { make in
          make.centerX.equalToSuperview()
          make.centerY.equalToSuperview()

      }
  }
}
