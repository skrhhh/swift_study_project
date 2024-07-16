//
//  AppDelegate.swift
//  Project7
//
//  Created by admin on 2024/6/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        let viewController1 = ViewController()
        let navController1 = UINavigationController(rootViewController: viewController1)
        navController1.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let viewController2 = ViewController()
        let navController2 = UINavigationController(rootViewController: viewController2)
        navController2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        tabBarController.viewControllers = [navController1,viewController2]
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

