//
//  RestorePasswordViewModel.swift
//  Peny
//
//  Created by Yelena Gorelova on 17.01.2024.
//

import Foundation

class RestorePasswordViewModel {

  weak var appCoordinator : AuthCoordinator!

  func goToLoginVC(){
    appCoordinator.goToLoginPage()
  }
}
