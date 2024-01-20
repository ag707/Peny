//
//  RegisteViewModel.swift
//  Peny
//
//  Created by Yelena Gorelova on 16.01.2024.
//

import Foundation

class RegisterViewModel {

  weak var appCoordinator : AuthCoordinator!

  func goToLogin(){
    appCoordinator.goToPetRegisterPage()
  }
}

