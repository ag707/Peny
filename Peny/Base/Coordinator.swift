//
//  Coordinator.swift
//  Peny
//
//  Created by Yelena Gorelova on 26.10.2023.
//

import Foundation
import UIKit

//typealias CoordinatorHandler = () -> ()

protocol Coordinator: AnyObject {

  var parentCoordinator: Coordinator? { get set }
  var children: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }
//  var flowCompletionHandler: CoordinatorHandler? { get set }

  func start()
}
