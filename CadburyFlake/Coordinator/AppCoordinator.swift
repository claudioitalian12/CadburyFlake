//
//  AppCoordinator.swift
//  CadburyFlake
//
//  Created by Claudio Cavalli on 10/12/2019.
//  Copyright © 2019 Claudio Cavalli. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol SettingsListener {
    func didSettings()
}

class AppCoordinator: BaseCoordinator {
    
    var window: UIWindow?
    
    override func start(window: UIWindow) {
        self.navigationController.navigationBar.isHidden = true
        self.window = window
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
        let coordinator = MapViewCoordinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}

extension AppCoordinator: SettingsListener {
    func didSettings() {
        //  self.navigationController.showAlert(title: "Success", message: "Signed in")
        // TODO: Navigate to Dashboard
    }
}
