//
//  MainRouter.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol MainRouterProtocol {
    func navigationToWeatherScene(weatherDTO: WeatherDTO)
}

class MainRouter: MainRouterProtocol {
    
    let weatherAssembly: WeatherAssembly
    let view: MainViewControllerProtocol
    
    init(weatherAssembly: WeatherAssembly, view: MainViewControllerProtocol) {
        self.weatherAssembly = weatherAssembly
        self.view = view
    }
    
    func navigationToWeatherScene (weatherDTO: WeatherDTO) {
        self.view.navigationToWeather(destinationVC: weatherAssembly.viewController(weatherDTO: weatherDTO))
    }
}
