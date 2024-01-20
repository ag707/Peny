//
//  AuthCoordinator.swift
//  Peny
//
//  Created by Yelena Gorelova on 16.01.2024.
//

import Foundation
import UIKit

class AuthCoordinator : Coordinator {

    weak var parentCoordinator: Coordinator?

    var children: [Coordinator] = []

    var navigationController: UINavigationController

    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }


    func start() {
        print("AuthCoordinator Start")
        goToLoginPage()
    }


    func goToLoginPage() {
        // Instantiate LoginViewController
        let loginViewController = PetLoginVC()

        // Instantiate LoginViewModel
        let loginViewModel = LoginViewModel.init()

        // Set the Coordinator to the ViewModel
        loginViewModel.appCoordinator = self

        // Set the ViewModel to ViewController
        loginViewController.viewModel = loginViewModel

        // Push it.
        navigationController.pushViewController(loginViewController, animated: true)
    }


  func goToRestorePasswordPage() {
    let restoreViewController = PetRestorePasswordVC()
    let restoreViewModel = LoginViewModel.init()
    restoreViewModel.appCoordinator = self

    restoreViewController.viewModel = restoreViewModel

    navigationController.pushViewController(restoreViewController, animated: true)

  }
    func goToRegisterPage(){
        let registerViewController = RegistrationVC()
        let registerViewModel = RegisterViewModel.init()
        registerViewModel.appCoordinator = self

        registerViewController.viewModel = registerViewModel

        navigationController.pushViewController(registerViewController, animated: true)
    }

  func goToPetRegisterPage(){
      let registerViewController = PetRegistarationVC()
      let registerViewModel = RegisterViewModel.init()
      registerViewModel.appCoordinator = self

      registerViewController.viewModel = registerViewModel

      navigationController.pushViewController(registerViewController, animated: true)
  }

//  func goToLoginVC() {
//
//    let loginViewController = PetLoginVC()
//    let loginViewModel = RestorePasswordViewModel.init()
//    loginViewModel.appCoordinator = self
//
//    loginViewController.viewModelLogin = loginViewModel
//
//    navigationController.popViewController(animated: true)
//  }

    deinit {
        print("AuthCoordinator Deinit")
    }
}
