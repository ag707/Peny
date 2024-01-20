//
//  LoginViewModel.swift
//  Peny
//
//  Created by Yelena Gorelova on 16.01.2024.
//

import Foundation

class LoginViewModel {

    weak var appCoordinator : AuthCoordinator!

  func goToRestorePassword() {
    appCoordinator.goToRestorePasswordPage()
  }

    func goToRegister(){
        appCoordinator.goToRegisterPage()
    }
}
