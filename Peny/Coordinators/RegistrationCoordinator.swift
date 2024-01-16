//
//  RegistrationCoordinator.swift
//  Peny
//
//  Created by Yelena Gorelova on 26.10.2023.
//

import Foundation
import UIKit

class RegistrationCoordinator: Coordinator {

  var navigationController: UINavigationController
  var flowCompletionHandler: CoordinatorHandler?

  private let moduleFactory = ModuleFactory()
  private var userData = UserData.init(phoneNumber: nil, email: nil, password: nil, name: nil, birthday: nil)

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    showPetLoginModule()
  }


  private func showPetLoginModule() {

    let controller = moduleFactory.createPetLoginModule()

    controller.completionHandler = { [weak self] value in
      self?.userData.phoneNumber = value
      self?.showPetRestorePasswordModule()

    }
    navigationController.pushViewController(controller, animated: true)
  }

  private func showPetRestorePasswordModule() {

    let controller = moduleFactory.createPetRestorePasswordModule()

    controller.completionHandler = { [weak self] value in

//            self?.userData.phoneNumber = value
//            self?.showPetRestorePasswordModule()
      //    }
      if (value != nil) {
        self?.showRegistrationModule()
      } else {
        // show error
      }
    }

    navigationController.pushViewController(controller, animated: true)
  }


  private func showRegistrationModule() {

    let controller = moduleFactory.createRegistrationModule()

    controller.completionHandler = { [weak self] value in
      self?.userData.email = value
      self?.showPetRegistrationModule()
    }
    navigationController.pushViewController(controller, animated: true)
  }


  private func showPetRegistrationModule() {

    let controller = moduleFactory.createPetRegistrationModule()

    controller.completionHandler = { [weak self] value in
      self?.userData.email = value
      self?.flowCompletionHandler?()
    }
    navigationController.pushViewController(controller, animated: true)
  }
}
