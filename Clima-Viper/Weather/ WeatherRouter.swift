//
//   WeatherRouter.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol WeatherRouterProtocol {
    func navigationToCheckOtherCityFromRouter()
}

class WeatherRouter: WeatherRouterProtocol {
    let otherAssembly: OtherAssembly
    let view: WeatherViewController

    init(otherAssembly: OtherAssembly, view: WeatherViewController) {
        self.otherAssembly = otherAssembly
        self.view = view
    }

    func navigationToCheckOtherCityFromRouter() {
        self.view.navigationToOtherVC(destinationVC: otherAssembly.view(delegate: view))
    }
}

