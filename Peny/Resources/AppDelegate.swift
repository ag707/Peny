//
//  AppDelegate.swift
//  Peny
//
//  Created by Yelena Gorelova on 10.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var appCoordinator : AppCoordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    window = UIWindow(frame: UIScreen.main.bounds)

    let navigationCon = UINavigationController.init()
    appCoordinator = AppCoordinator(navigationController: navigationCon)
    appCoordinator!.start()

    window!.rootViewController = navigationCon
    window!.makeKeyAndVisible()

    return true
  }

}




