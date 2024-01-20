//
//  Coordinator.swift
//  Peny
//
//  Created by Yelena Gorelova on 26.10.2023.
//

import Foundation
import UIKit


protocol Coordinator: AnyObject {

  var parentCoordinator: Coordinator? { get set }
  var children: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }

  func start()
}
