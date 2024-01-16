//
//  AppCoordinator.swift
//  Peny
//
//  Created by Yelena Gorelova on 26.10.2023.
//

import UIKit

class AppCoordinator: Coordinator {

  var parentCoordinator: Coordinator?
  var children: [Coordinator] = []
  var navigationController: UINavigationController

//  var navigationController: UINavigationController
//  var flowCompletionHandler: CoordinatorHandler?

//  private var childCoordinators: [Coordinator] = []

  init(navCon: UINavigationController) {
    self.navigationController = navCon
  }

  func start() {
    let isAuth = false

    if !isAuth {
      showRegistrationFlow()

    } else {
      showMainFlow()
    }
  }

  private func showRegistrationFlow() {

    let registrationCoordinator = CoordinatorFactory().createRegistrationCoordinator(navigationController: navigationController)

    children.append(registrationCoordinator)

    registrationCoordinator.flowCompletionHandler = { [weak self] in
      self?.showMainFlow()
    }

    registrationCoordinator.start()
  }

  private func showMainFlow() {
    navigationController.setViewControllers([ViewControllerDemo()], animated: true)
  }
}
