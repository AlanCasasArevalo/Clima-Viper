//
//  AppAssembly.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

final class AppAssembly {
    
    private (set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private (set) lazy var navigationController = UINavigationController()
    private (set) lazy var coreAssembly = CoreAssembly(navigationController: navigationController)
}
