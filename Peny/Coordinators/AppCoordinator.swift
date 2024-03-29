//
//  AppCoordinator.swift
//  Peny
//
//  Created by Yelena Gorelova on 26.10.2023.
//

import UIKit

class AppCoordinator : Coordinator {
    var parentCoordinator: Coordinator?

    var children: [Coordinator] = []

    var navigationController: UINavigationController

    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        print("AppCoordinator Start")
        // The first time this coordinator started, is to launch login page.
       goToAuth()
    }

    func goToAuth(){
        // For the first time, the app is going to go to Authentication module
        let authCoordinator = AuthCoordinator.init(navigationController: navigationController)
        authCoordinator.parentCoordinator = self
        children.append(authCoordinator)

        authCoordinator.start()
    }

    func goToHome(){
        // Initiate HomeTabBar Coordinator
//        let coordinator = HomeTabBarCoordinator.init(navigationController: navigationController)
//        coordinator.parentCoordinator = self
//        children.append(coordinator)
//
//        coordinator.start()
    }

    deinit {
        print("AppCoordinator Deinit")
    }
}

