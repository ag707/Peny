//
//  ModuleFactory.swift
//  Peny
//
//  Created by Yelena Gorelova on 26.10.2023.
//

import Foundation

class ModuleFactory {

  func createPetLoginModule() -> PetLoginVC {
    PetLoginVC()
  }

  func createPetRestorePasswordModule() -> PetRestorePasswordVC {
    PetRestorePasswordVC()
  }

  func createRegistrationModule() -> RegistrationVC {
    RegistrationVC()
  }

  func createPetRegistrationModule() -> PetRegistarationVC {
    PetRegistarationVC()
  }
}
