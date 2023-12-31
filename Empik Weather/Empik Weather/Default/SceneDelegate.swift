//
//  SceneDelegate.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 10/12/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appDelegate: AppDelegate? {
        UIApplication.shared.delegate as? AppDelegate
    }
    var coordinator: CoordinatorProtocol? {
        appDelegate?.coordinator
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let coordinator = coordinator {
            setupScene(scene: scene, coordinator: coordinator)
        }
    }
    
    func sceneDidBecomeActive(_: UIScene) {
        coordinator?.refreshWeatherDetails()
    }

    private func setupScene(scene: UIScene, coordinator: CoordinatorProtocol) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        guard let mainNavigationController = coordinator.mainNavigationController else { return }
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
    }
}

