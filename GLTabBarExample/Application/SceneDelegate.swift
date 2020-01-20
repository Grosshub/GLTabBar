//
//  SceneDelegate.swift
//  GLTabBarExample
//
//  Created by Alexey Gross on 06/09/2019.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarViewController = TabBarController()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = MainViewController(tabBarViewController: tabBarViewController)
        window?.makeKeyAndVisible()
    }
}

