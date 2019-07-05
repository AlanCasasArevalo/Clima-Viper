//
//  CoreAssembly.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

final public class CoreAssembly {

    private(set) lazy var webServiceAssembly = WebServiceAssembly()
    private(set) lazy var mainAssembly = MainAssembly(webServiceAssembly: webServiceAssembly, weatherAssembly: weatherAssembly)
    private(set) lazy var weatherAssembly = WeatherAssembly(webServiceAssembly: webServiceAssembly)

    private let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
